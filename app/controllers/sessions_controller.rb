class SessionsController < ApplicationController

  ## Registration page, allows user to create a new account ##
  get '/register' do
    redirect '/home' if authorized?
    erb :"/users/register"
  end


  ## Log in page for user. If user is already logged in, redirects them to home page. ##
  get '/login' do
    redirect '/home' if authorized?

    @failed = false ## for error message
    erb :'/users/login'
  end


  ## Post request for the log in form. If user logs in correctly, we set their current session user_id and redirect them to their homepage. If failed log in, we bring them back to log in page and show error message.
  post '/login' do
    user = User.find_by(username: params[:username])
    
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/home"
    else
      @failed = true ## for error message
      erb :'/users/login'
    end
  end


  ## Post request for after a user is created. If user is able to save, then session id is linked to current user and gets redirected to home.
  post '/register' do
    redirect '/home' if authorized?
    
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      erb :'/users/register'
    end
  end


  ## The D in CRUD.
  ## Uncomment this block if I decide to use ugly log out button
  delete '/logout' do
    session.clear if logged_in?
    redirect '/'
  end

end