class ApplicationController < Sinatra::Base

  ## sets everything up
  configure do
    set :public_folder, 'public'  ## sets the location for public folder
    set :views, 'app/views'   ## sets the location for views folder
    enable :sessions  ## allows us to have sessions
    set :session_secret, SESSION_SECRET  ## sets the secret hex key for password security
  end

  
  ## the very first page of our app. Kind of like our welcome page that leads to log in or registration
  get '/' do
    authenticate
    erb :index
  end


  ## helper methods for our controllers
  helpers do

    ## checks whether our user is logged in or not for the current session
    def logged_in?
      !!session[:user_id]
    end


    ## gives us the current user to work with
    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end


    ## checks to see if user is authorized. If they're not logged in, they get redirected to log in page
    def authenticate
      if !logged_in? || current_user.nil?
        redirect '/login'
      end
    end


    ## checks to see if user is logged in and current user is available
    def check_if_user_authorized?
      !!logged_in? && !current_user.nil?
    end

    ## authenticates and also checks if user was the one who added that meal so they can edit.
    def authenticate_user_for_editing_meals(meal)
      authenticate
      redirect '/meals' if !meal
      redirect '/meals' if current_user != meal.user
    end


    ## authenticates user to edit user info, if not, redirect
    def authenticate_user_for_editing_user(user)
      authenticate
      redirect "/user/#{current_user.id}/edit" if !user
      redirect "/user/#{current_user.id}/edit" if current_user != user
    end


    # def check_if_integer?(params)
    #   (params[:user][:age].to_i.is_a? Integer) || (params[:user][:height].to_i.is_a? Integer) || (params[:user][:weight].to_i.is_a? Integer)
      
    # end

    # def authenticate_user_for_editing_user(user)
    #   authenticate
    #   redirect "/home/#{user.id}" if !user
    #   redirect "/home/#{user.id}" if current_user.id != user.id
    # end

    def check_and_show_errors(user)
      @errors = user.errors.full_messages
      if user.errors.any?
        @errors
        erb :"/users/edit"
      end
    end

    def any_errors?(thing)
      thing.errors.any?
    end

    def get_error_messages(thing)
      @errors = thing.errors.full_messages
    end
  
  end

  
end