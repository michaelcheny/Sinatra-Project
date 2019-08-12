class MealController < ApplicationController
  
  ## Gets the /meal request and displays the meal page
  get '/meals' do
    ## checks if user is logged in and if current user is current user
    authenticate
    # binding.pry
    ## Grabs the meals for the current user only
    @meals = current_user.meals
    erb :"/meals/meals_index"
  end


  ## Page to add a new meal
  get '/meals/new' do
    authenticate

    erb :'/meals/new'
  end

  
  ## post request from new meal form
  post '/meals' do

    meal = Meal.new(params[:meal])
    current_user.meals << meal
    current_user.save
    # binding.pry
    redirect '/meals'
  end




end