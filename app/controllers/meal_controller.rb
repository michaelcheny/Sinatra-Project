class MealController < ApplicationController
  
  ## Gets the /meal request and displays the meal page
  get '/meals' do

    ## checks if user is logged in and if current user is current user
    authenticate
    check_if_user_authorized?
    # binding.pry
    erb :"/meals/index"
  end


    # change index file name to something else
    # change name of all the routes to fit app better
    # for users
    # homepage should be /home/:id
    # meal should follow same structure


end