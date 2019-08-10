class SessionsController < ApplicationController


  ## Registration page, allows user to create a new account ##
  get '/register' do
    redirect '/users/:id' if authorized?
    erb :"/users/register"
  end


  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/users/:id' do
    # @users = User.all
    authenticate
    current_user
    binding.pry
    # if @current_user.weight.nil? 
    #   redirect "/users/#{@current_user.id}/edit"
    # else
    erb :"/users/home"
    # end
  end


  ## Log in page for user. If user is already logged in, redirects them to home page. ##
  get '/login' do
    redirect '/users/:id' if authorized? 

    @failed = false ## for error message

    erb :'/users/login'
  end

  ## edit user and finish adding info
  get '/users/:id/edit' do
      authenticate
      @user = User.find_by_id(params[:id])

      current_user

      erb :'/users/edit'
   
  end


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


  post '/register' do
    redirect '/users/:id' if authorized?

    user = User.new(params[:user])
    # binding.pry
    if user.save
      session[:user_id] = user.id
      redirect '/users/:id'
    else
      erb :"/users/register"
    end
  end


  ## update
  patch '/users/:id' do
    
    authenticate
    current_user
    binding.pry
    @current_user.update(params[:user])
    binding.pry


    # erb :"users/home"
    redirect :"/users/#{@current_user.id}"
  end

  







end