class SessionsController < ApplicationController


  get '/home' do
    @users = User.all
    authenticate
    erb :'/users/home'
  end


  get '/users/new' do
    erb :"/users/register"
  end


  get '/login' do
    redirect '/home' if logged_in? 

    @failed = false
    erb :'/users/login'
  end


  post '/login' do
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/home"
    else
      @failed = true
      erb :'/users/login'
    end

  end
  
  
end