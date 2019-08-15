class MealController < ApplicationController
  
  ## Gets the /meal request and displays the meal page
  get '/meals' do
    ## checks if user is logged in and if current user is current user
    authenticate
    ## Grabs the meals for the current user only

    
    # if current_user.tdee.nil?
    #   @not_filled = true
    #   erb :"/users/home"
    # else
      @meals = current_user.meals
      ## Sorts meal by newest on top
      @sorted_meals = MealHelper.sort_meals(@meals)

      @failed = false

      erb :"/meals/index"
    # end
  end


  ## Page to add a new meal
  get '/meals/new' do
    authenticate
    ## CHECK TO SEE IF CURRENTUSER HAS NIL STILL
    if current_user.tdee.nil?
      @not_filled = true
      erb :"/users/home"
    else
    erb :'/meals/new'
    end
  end


  ## Edit page for meals
  get '/meals/:id/edit' do
    
    @meal = Meal.find_by(id: params[:id])
    # binding.pry
    ## only the creator can edit
    authenticate_user_for_editing_meals(@meal)
    # if @meal
    # binding.pry
      erb :"/meals/edit"
    # else
    #   erb :"error"
    # end
  end


  ## Display page with meal from today only
  get '/meals/today' do
    authenticate

    meals = MealHelper.grab_meals_from_today(current_user.meals) 

    @sorted_meals = MealHelper.sort_meals(meals)

    ## gets the current_cals for the user.
    @current_calories = CalculationHelpers.calculate_current_calories(current_user)

    # binding.pry

    erb :"/meals/today"
  end

  
  ## post request from new meal form
  post '/meals' do
    authenticate

    @meal = Meal.new(params[:meal])
    
    current_user.meals << @meal

    if @meal.save
      current_user.save
      redirect '/meals'
    else
      @failed = true
      erb :"/meals/new"
    end
  end


  ## Edits the choosen meal
  patch '/meals/:id' do
    meal = Meal.find_by(id: params[:id])

    authenticate_user_for_editing_meals(meal)

    if meal.update(params[:meal])
      redirect '/meals'
    else
      erb :"/meals/edit"
    end
  end


  ## DELETE CURRENT MEAL
  delete '/meals/:id' do
    authenticate
    meal = Meal.find_by(id: params[:id])
    if meal ## if found, delete it
      meal.destroy
      redirect "/meals"
    end
  end




end