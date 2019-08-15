class UserController < ApplicationController

  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/home' do
    # @users = User.all
    authenticate

    @failed = false
    erb :'/users/home'
  end


  ## edit user info like weight, height, etc.
  get '/user/edit' do
    authenticate
    # check_if_user_authorized?
    # authenticate_user_for_editing_user(current_user)

    erb :'/users/edit'
  end


  ## update users info like age, height, weight, activity level
  patch '/home/:id' do
    authenticate
    
    ## gets params for gender,age,height,weight

    @user = current_user

    @user.update(params[:user])

    if @user.errors.any?

      @errors = @user.errors.full_messages

      erb :"/users/edit"
    else      
      ## drop another conditional here 
      @user.update(params[:user])

      ## updates bmr based on those params
      @user.update(bmr: CalculationHelpers.calculate_user_bmr(@user))
      binding.pry
      ## updates tdee based on bmr and activity lvl
      @user.update(tdee: CalculationHelpers.calculate_user_tdee(@user))

      redirect :"/home"
    end
  end



end