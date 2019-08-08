class SessionsController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/new' do
    erb :"/users/register"
  end

  get '/login' do 
    @failed = false
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :'/meals/index'
    else
      @failed = true
      erb :'/users/login'
    end

  end
  
end