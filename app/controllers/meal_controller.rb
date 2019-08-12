class MealController < ApplicationController
  
  ## Gets the /meal request and displays the meal page
  get '/meals' do

    ## checks if user is logged in and if current user is current user
    authenticate
    # check_if_user_authorized?
    # binding.pry
    @meals = Meal.all
    erb :"/meals/meals_index"
  end

  ## Page to add a new meal
  get '/meals/new' do
    authenticate
    # check_if_user_authorized?

    erb :'/meals/new'
  end

  
  ## post request from new meal form
  post '/meals' do

    meal = Meal.new(params[:meal])
    current_user.meals << meal
    current_user.save

    redirect '/meals'

  end


    # change index file name to something else
    # change name of all the routes to fit app better
    # for users
    # homepage should be /home/:id
    # meal should follow same structure


end