class MealController < ApplicationController
  
  ## Gets the /meal request and displays the meal page
  get '/meals' do

    ## checks if user is logged in and if current user is current user
    authorized?
    # binding.pry

    # change index file name to something else
    # change name of all the routes to fit app better
    # for users
    # homepage should be /home/:id
    # meal should follow same structure


    erb :"/meals/index"
  end




end