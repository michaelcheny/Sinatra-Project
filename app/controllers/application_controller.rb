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

    ## gets user from :id and authenticates that user
    def check_user_authorization
      @user = User.find_by(id: params[:id])
      authenticate_user_for_editing_user(@user)
    end


      ## might delete if not used
    # def check_and_show_errors(user)
    #   @errors = user.errors.full_messages
    #   if user.errors.any?
    #     @errors
    #     erb :"/users/edit"
    #   end
    # end

    # "%A, %B %d, %Y" ====>>>>> Monday, August 30, 2019
    # %D ====>>>> 08/30/19
    ## Grabs meals added from today for current user
    def grab_meals_from_today(meals)
      today_meals = []
      meals.each do |meal|
        if meal.created_at.strftime("%D") == Date.today.strftime("%D")
          today_meals << meal
        end
      end
      today_meals
    end    

    ## Sorts the meals by newest on top
    def sort_meals(meals)
      meals.sort_by{|m| m.created_at}.reverse
    end

    ## gets the current calories for the user for today
    def get_current_calories(user)
      cals = 0
      meals = grab_meals_from_today(user.meals)
      meals.each do |meal|
        cals += meal.calories
      end
      @current_calories = cals
    end


    ## returns recommended calories for weight control based on user goals. 
    def recommended_calories_for_goal(user)
      if user.goal == "losing a pound a week"
        multiplier = 0.80
      elsif user.goal == "losing half a pound a week"
        multiplier = 0.90
      elsif user.goal == "maintaining weight"
        multiplier = 1
      elsif user.goal == "gaining half a pound a week"
        multiplier = 1.10
      elsif user.goal == "gaining a pound a week"
        multiplier = 1.20
      end    
      cal = user.tdee * multiplier
      return cal.to_i
    end


    ## calculates basal metabolic rate using the Harris-Benedict equation
    # def calculate_user_bmr(user)
    #   if user.gender == "male"
    #     bmr = (10 * (user.weight * 0.4535934)) + (6.25 * (user.height * 2.54)) - (5 * user.age) + 5
    #   elsif user.gender == "female"
    #     bmr = (10 * (user.weight * 0.4535934)) + (6.25 * (user.height * 2.54)) - (5 * user.age) - 161
    #   end
    #   return bmr.to_i
    # end    

    def calculate_user_bmr(user)
      if user.gender == "male"
        bmr = 66 + (user.weight * 6.23) + (12.7 * user.height) - (6.8 * user.age)
      elsif user.gender == "female"
        bmr = 655 + (user.weight * 4.35) + (4.7 * user.height ) - (4.7 * user.age) 
      end
      return bmr.to_i
    end      


    ## calculates total daily energy expedenture using BMR and activity level of user
    def calculate_user_tdee(user)
      # case user.activity_level
      # when "1"
      #   multiplier = 1.25
      # when "2" 
      #   multiplier = 1.475
      # when "3"
      #   multiplier = 1.72
      # when "4"
      #   multiplier = 2.35
      # end
      # tdee = user.bmr * multiplier
      # return tdee.to_i


      if user.activity_level == "1"
        multiplier = 1.25
      elsif user.activity_level == "2"
        multiplier = 1.475
      elsif user.activity_level == "3"
        multiplier = 1.72
      elsif user.activity_level == "4"
        multiplier = 2.25
      end
      tdee = user.bmr * multiplier
      return tdee.to_i




    end    

  
  end

  
end