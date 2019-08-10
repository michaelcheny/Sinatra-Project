class SessionsController < ApplicationController

  ## Home page for the user. Checks to see if user is logged in, if not, will redirect to login page ##
  get '/users/:id' do
    # @users = User.all
    
    authenticate
    current_user

    # if @current_user.weight.nil? 
    #   redirect "/users/#{@current_user.id}/edit"
    # else
    erb :"/users/home"
    # end
    

    
  end

  ## Registration page, allows user to create a new account ##
  get '/users/new' do
    # if logged_in?
      
    #   redirect "/users/#{@current_user.id}"
    # else
      erb :"/users/register"
    # end
  end

  ## Log in page for user. If user is already logged in, redirects them to home page. ##
  get '/login' do
    redirect '/users/:id' if logged_in? 

    @failed = false ## for error message

    erb :'/users/login'
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
  ## edit user and finish adding info
  get '/users/:id/edit' do
      authenticate
      @user = User.find_by_id(params[:id])

      current_user

      erb :'/users/edit'
   
  end

  ## update
  patch '/users/:id' do
    
    authenticate
    current_user

    @current_user.update(gender: params[:gender], age: params[:age].to_i, height: params[:height].to_i, weight: params[:weight].to_i, activity_level: params[:activity_level])


    redirect :"/users/#{@current_user.id}"
  end
  

end