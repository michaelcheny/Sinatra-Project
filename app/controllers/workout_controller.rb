class WorkoutController < ApplicationController

  get '/workouts' do
    authenticate
    @workouts = current_user.workouts
    @sorted_workouts = sort_meals(@workouts)
    @failed = false    
    erb :"/workouts/index"
  end


  ## Page to add a new meal
  get '/workouts/new' do
    authenticate
    ## for the if @user.errors.any on form
    @user = current_user
    if current_user.tdee.nil?
      @not_filled = true
      erb :"/users/edit"
    else
      @failed = false
      erb :'/workouts/new'
    end
  end

  ## Edit page for workouts
  get '/workouts/:id/edit' do
    @workout = Workout.find_by(id: params[:id])
    authenticate_user_for_editing_workouts(@workout)
    erb :"/workouts/edit"
  end

  ## Display page with workouts from today only
  get '/workouts/today' do
    authenticate
    workouts = grab_meals_from_today(current_user.workouts)
    @sorted_workouts = sort_meals(workouts)
    # @current_calories = get_current_calories(current_user)
    erb :"/workouts/today"
  end



     ## post request from new workout form
  post '/workouts' do
    authenticate
    @workout = Workout.new(params[:workout])
    current_user.workouts << @workout
    if @workout.save
      current_user.save
      redirect '/workouts'
    else  
      @failed = true
      erb :"/workouts/new"
    end
  end

  ## Edits the choosen workout
  patch '/workouts/:id' do
    @workout = Workout.find_by(id: params[:id])
    authenticate_user_for_editing_workouts(@workout)
    if @workout.update(params[:workout])
      redirect '/workouts'
    else
      erb :"/workouts/edit"
    end
  end


  ## DELETE CURRENT MEAL
  delete '/workouts/:id' do
    workout = Workout.find_by(id: params[:id])
    authenticate_user_for_editing_workouts(workout)
    if workout ## if found, delete it
      workout.destroy
      redirect "/workouts"
    end
  end


  ## shows all the meals for all users
  get '/workouts/all' do
    authenticate
    workouts = Workout.all 
    ## if there are meals, show them, else show error and go to add meal page
    if workouts
      @sorted_workouts = sort_meals(workouts)
    end
      erb :"/workouts/all"
  end

end