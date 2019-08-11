class SessionsController < ApplicationController


  ## Registration page, allows user to create a new account ##
  get '/register' do
    redirect '/users/:id' if check_if_user_authorized?
    erb :"/users/register"
  end


  # ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  # get '/users/:id' do
  #   # @users = User.all
  #   authenticate
  #   check_if_user_authorized?

  #   erb :"/users/home"
  # end


  ## Log in page for user. If user is already logged in, redirects them to home page. ##
  get '/login' do
    redirect '/users/:id' if check_if_user_authorized? 

    @failed = false ## for error message

    erb :'/users/login'
  end

  # ## edit user and finish adding info
  # get '/users/:id/edit' do
  #   authenticate
  #   check_if_user_authorized?

  #   erb :'/users/edit'
  # end


  ## Post request for the log in form. If user logs in correctly, we set their current session user_id and redirect them to their homepage. If failed log in, we bring them back to log in page and show error message.
  post '/login' do
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @failed = true ## for error message
      erb :'/users/login'
    end
  end

  ## Post request for after a user is created. If user is able to save, then session id is linked to current user and gets redirected to home.
  post '/register' do
    redirect '/users/:id' if check_if_user_authorized?

    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect '/users/:id'
    else
      erb :"/users/register"
    end
  end


  # ## update users info like age, height, weight, activity level
  # patch '/users/:id' do

  #   check_if_user_authorized?
    
  #   @current_user.update(params[:user])
  #   binding.pry

  #   redirect :"/users/#{@current_user.id}"
  # end


  ## DEDEDEDELETEEEEEEEEEEEEEEEEEEEEE
  delete '/logout' do
    session.clear if logged_in?
    redirect '/'
  end

end