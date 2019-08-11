class UserController < ApplicationController

  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/users/:id' do
    # @users = User.all
    authenticate
    check_if_user_authorized?

    erb :"/users/home"
  end


  ## edit user and finish adding info
  get '/users/:id/edit' do
    authenticate
    check_if_user_authorized?

    erb :'/users/edit'
  end

  ## update users info like age, height, weight, activity level
  patch '/users/:id' do

    check_if_user_authorized?
    
    @current_user.update(params[:user])
    binding.pry

    redirect :"/users/#{@current_user.id}"
  end



end