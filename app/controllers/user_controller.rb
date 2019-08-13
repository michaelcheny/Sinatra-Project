class UserController < ApplicationController

  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/home/:id' do
    # @users = User.all
    authenticate

    erb :'/users/home'
  end


  ## edit user info like weight, height, etc.
  get '/users/:id/edit' do
    authenticate
    check_if_user_authorized?

    erb :'/users/edit'
  end


  ## update users info like age, height, weight, activity level
  patch '/home/:id' do

    authenticate
    
    @current_user.update(params[:user])
    # binding.pry

    redirect :"/home/#{@current_user.id}"
  end



end