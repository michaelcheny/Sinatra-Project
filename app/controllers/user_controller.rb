class UserController < ApplicationController

  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/home' do
    authenticate
    ## to be able to use _form.erb
    @user = current_user

    @current_calories = get_current_calories(@user)
    # binding.pry
    @failed = false
    erb :'/users/home'
  end


  ## edit user info like weight, height, etc.
  get '/user/:id/edit' do
    ## checks if the current user have access to edit
    check_user_authorization
   
    erb :'/users/edit'
  end


  ## update users info like age, height, weight, activity level
  patch '/home/:id' do
    ##authorizes and checks if that current user can edit their own and not others
    check_user_authorization
    ## updates the user with params passed in
    @user = current_user
    @user.update(params[:user])
    ## if any errors, display edit form with errors
    if @user.errors.any?
      erb :"/users/edit"
    else      
      ## error-free updating
      # @user.update(params[:user])
      ## updates bmr based on those params
      @user.update(bmr: CalculationHelpers.calculate_user_bmr(@user))
      ## updates tdee based on bmr and activity lvl
      @user.update(tdee: CalculationHelpers.calculate_user_tdee(@user))
      redirect :"/home"
    end
  end



end