class MealController < ApplicationController
  
  ## Gets the /meal request and displays the meal page
  get '/meals' do
    ## checks if user is logged in and if current user is current user
    authenticate
    # binding.pry
    ## Grabs the meals for the current user only
    @meals = current_user.meals

    @failed = false

    erb :"/meals/index"
  end


  ## Page to add a new meal
  get '/meals/new' do
    authenticate

    erb :'/meals/new'
  end


  ## Edit page for meals
  get '/meals/:id/edit' do
    
    @meal = Meal.find_by(id: params[:id])
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
    @meals = current_user.meals


    cc = current_calories(current_user)

    binding.pry

    erb :"/meals/today"
  end

  
  ## post request from new meal form
  post '/meals' do
    authenticate

    @meal = Meal.new(params[:meal])
    # binding.pry
    current_user.meals << @meal
    if @meal.save
      current_user.save
      # binding.pry
      redirect '/meals'
    else
      @failed = true
      erb :"/meals/new"
    end
  end

  patch '/meals' do
    @meal = Meal.find_by(id: params[:id])
    authenticate_user_for_editing_meals(@meal)


  end


  ## DELETE THIS 
  delete '/meals/:id' do
    authenticate
    meal = Meal.find_by(id: params[:id])
    if meal ## if found, delete it
      meal.destroy
      redirect "/meals"
    end
  end




end