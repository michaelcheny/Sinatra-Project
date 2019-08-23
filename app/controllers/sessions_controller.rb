class SessionsController < ApplicationController

  ## Registration page, allows user to create a new account ##
  get '/register' do
    redirect '/home' if authorized?
    erb :"/users/register"
  end


  ## Log in page for user.  
  get '/login' do
    ## If user is already logged in and authorized, redirects them to home page.
    redirect '/home' if authorized? 
    @failed = false ## for error message
    erb :'/users/login'
  end


  ## Post request for the log in form.  
  post '/login' do
    user = User.find_by(username: params[:username])
    ## If user logs in correctly, we set their current session user_id and redirect them to their homepage.
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/home"
    else 
      ## If failed log in, we bring them back to log in page and show error message.
      @failed = true ## for error message
      erb :'/users/login'
    end
  end


  ## Post request for after a user is created. 
  post '/register' do
    redirect '/home' if authorized?
    @user = User.new(params[:user])
    ## If user is able to save (errors aren't triggered), then session id is linked to current user and gets redirected to home.
    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      erb :'/users/register'
    end
  end


  ## The D in CRUD.
  delete '/logout' do
    session.clear if logged_in?
    redirect '/'
  end

end