class UserController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/new' do
    erb :"/users/register"
  end

  get '/login' do 
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      erb :'/meals/index'
    else
      "REDO REDO REDO REDO"
      redirect :'/login'
    end

  end


  # helpers do

  #   def logged_in?
  #     !!session[:user_id]
  #   end

  #   def current_user
  #     User.find_by(id: session[:user_id])
  #   end

  # end

end