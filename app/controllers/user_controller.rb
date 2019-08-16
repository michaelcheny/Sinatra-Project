class UserController < ApplicationController

  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/home' do
    # @users = User.all
    authenticate
    ## to be able to use _form.erb
    @user = current_user

    @failed = false
    erb :'/users/home'
  end


  ## edit user info like weight, height, etc.
  get '/user/:id/edit' do
    ## makes sure the user doesn't do anything sketchy
    # @user = User.find_by(id: params[:id])

    ## checks if the current user have access to edit
    check_user_authorization
   
    erb :'/users/edit'
  end


  ## update users info like age, height, weight, activity level
  patch '/home/:id' do
    ##authorizes and checks if that current user can edit their own and not others
    check_user_authorization

    ## gets params for gender,age,height,weight
    @user = current_user

    @user.update(params[:user])
    ## if any errors, display edit form with errors
    if @user.errors.any?
      erb :"/users/edit"
    else      
      ## error-free updating
      @user.update(params[:user])
      ## updates bmr based on those params
      @user.update(bmr: CalculationHelpers.calculate_user_bmr(@user))
      ## updates tdee based on bmr and activity lvl
      @user.update(tdee: CalculationHelpers.calculate_user_tdee(@user))
      redirect :"/home"
    end
  end



end