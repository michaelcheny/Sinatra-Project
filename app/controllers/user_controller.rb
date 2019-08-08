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
  end

end