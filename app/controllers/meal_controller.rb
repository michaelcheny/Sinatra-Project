class MealController < ApplicationController
  
  ## Gets the /meal request and displays the meal page
  get '/meals' do
    ## checks if user is logged in and if current user is current user
    authenticate
    ## Grabs the meals for the current user only
    @meals = current_user.meals
    ## Sorts meal by newest on top
    @sorted_meals = sort_meals(@meals)
    @failed = false
    erb :"/meals/index"
  end


  ## Page to add a new meal
  get '/meals/new' do
    authenticate
    ## for the if @user.errors.any on form
    @user = current_user
    ## CHECK TO SEE IF CURRENTUSER HAS NIL STILL
    if current_user.tdee.nil?
      @not_filled = true
      erb :"/users/edit"
    else
      @failed = false
      erb :'/meals/new'
    end
  end


  ## Edit page for meals
  get '/meals/:id/edit' do
    @meal = Meal.find_by(id: params[:id])
    ## only the creator can edit
    authenticate_user_for_editing_meals(@meal)
    erb :"/meals/edit"
  end


  ## Display page with meal from today only
  get '/meals/today' do
    authenticate
    ## Collects meal from today
    meals = grab_meals_from_today(current_user.meals)
    ## sort newest meal on top
    @sorted_meals = sort_meals(meals)
    # ## gets the current_cals for the user.
    # @current_calories = get_current_calories(current_user)
    erb :"/meals/today"
  end

  
  ## post request from new meal form
  post '/meals' do
    authenticate

    ## Creates the new meal
    @meal = Meal.new(params[:meal])
    ## dumps the meal into current user's meals array
    current_user.meals << @meal
    ## if meal saves with no error, save current user's meal array and go to index for meals
    if @meal.save
      current_user.save
      redirect '/meals'
    else  ## if meal doesn't save cause of error
      @failed = true
      erb :"/meals/new"
    end
  end


  ## Edits the choosen meal
  patch '/meals/:id' do
    @meal = Meal.find_by(id: params[:id])
    ## only lets creator of meal edit
    authenticate_user_for_editing_meals(@meal)
    ## if meal updates, redirect to meal index page
    if @meal.update(params[:meal])
      redirect '/meals'
    else
      erb :"/meals/edit"
    end
  end


  ## DELETE CURRENT MEAL
  delete '/meals/:id' do
    
    meal = Meal.find_by(id: params[:id])
    authenticate_user_for_editing_meals(meal)
    if meal ## if found, delete it
      meal.destroy
      redirect "/meals"
    end
  end

  ## shows all the meals for all users
  get '/meals/all' do
    authenticate
    meals = Meal.all 
    ## if there are meals, show them, else show error and go to add meal page
    if meals
      @sorted_meals = sort_meals(meals)
    end
      erb :"/meals/all"
  end




end