class UserController < ApplicationController

  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/home' do
    authenticate
    
    @user = current_user
    @current_calories = get_current_calories(@user)

    if @user.tdee.nil? || @user.goal.nil?  ## usually right after registration theyre nill
      erb :"/users/edit"
    else

    @failed = false
    erb :'/users/home'

    end
  end


  ## edit user info like weight, height, etc.
  get '/user/:id/edit' do
    ## checks if the current user have access to edit
    check_user_authorization
    erb :'/users/edit'
  end


  ## update users info like age, height, weight, activity level
  patch '/home/:id' do
    ## authorizes and checks if that current user can edit their own and not others
    check_user_authorization
    ## updates the user with params passed in
    @user = current_user
    @user.update(params[:user])
    ## if any errors, display edit form with errors
    if @user.errors.any?
      erb :"/users/edit"
    else      
      ## error-free updating
      ## updates bmr based on those params
      @user.update(bmr: calculate_user_bmr(@user))
      ## updates tdee based on bmr and activity lvl
      @user.update(tdee: calculate_user_tdee(@user))
      redirect :"/home"
    end
  end



end