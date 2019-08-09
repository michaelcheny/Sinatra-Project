class SessionsController < ApplicationController

  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/home' do
    # @users = User.all
    
    authenticate
    current_user
    
    erb :'/users/home'
  end

  ## Registration page, allows user to create a new account ##
  get '/users/new' do
    erb :"/users/register"
  end

  ## Log in page for user. If user is already logged in, redirects them to home page. ##
  get '/login' do
    redirect '/home' if logged_in? 

    @failed = false ## for error message

    erb :'/users/login'
  end

  ## Post request for the log in form. If user logs in correctly, we set their current session user_id and redirect them to their homepage. If failed log in, we bring them back to log in page and show error message.
  post '/login' do
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/home"
    else
      @failed = true ## for error message
      erb :'/users/login'
    end

  end

  get '/users/:id/edit' do
    
      @user = User.find_by(id: params[:id])

      erb :'/users/edit'

    
  end
  

end