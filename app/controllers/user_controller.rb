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
  patch '/home' do
    authenticate
    
    ## gets params for gender,age,height,weight
    binding.pry
    if check_if_integer?(params)
      @failed = true
      erb :"/users/home"
    else      
      # binding.pry
      current_user.update(params[:user])

      binding.pry
      ## updates bmr based on those params
      current_user.update(bmr: CalculationHelpers.calculate_user_bmr(current_user))
      ## updates tdee based on bmr and activity lvl
      
      current_user.update(tdee: CalculationHelpers.calculate_user_tdee(current_user))

      # binding.pry

      redirect :"/home"
    end
  end



end