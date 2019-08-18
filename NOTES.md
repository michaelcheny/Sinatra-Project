Planning

Create Healthy Lifestyle App

Users are able to enter their weight, height, age 

User display page should auto calculate their TDEE based on info entered

calculations make new folder and new class calculator helper

Users have many meals, workouts, and drink water 

Meals consists of Calories, Fats, Carbs, Proteins.

Workouts consists of time spent, intensity level, calories burnt

Workouts will auto calculate calories burnt based on time and intensity

Users have with sessions


views: 

/signin and /login




    # change index file name to something else
    # change name of all the routes to fit app better
    # for users
    # homepage should be /home/:id
    # meal should follow same structure



make the text forms bigger



TIL if I put password confirmation thing, I need to seed my users with password: "blahblah", password_confirmation: "blahblah" as well

activerecord defaults at UTC time it kept effing up my 'sort by today' page. 
## changes timezone to local, instead of UTC
ActiveRecord::Base.default_timezone = :local
fixed the timezone issue.


BMR Formula (Imperial)
Women: BMR = 655 + (4.35 x weight in pounds) + (4.7 x height in inches) - (4.7 x age in years)

Men: BMR = 66 + (6.23 x weight in pounds) + (12.7 x height in inches) - (6.8 x age in years)

     ## calculates basal metabolic rate using the Harris-Benedict equation 
     def calculate_user_bmr(user)
       if user.gender == "male"
         bmr = 66 + (user.weight * 6.23) + (12.7 * user.height) - (6.8 * user.age)
       elsif user.gender == "female"
         bmr = 655 + (user.weight * 4.35) + (4.7 * user.height ) - (4.7 * user.age)
       end
       return bmr.to_i
     end

    ## calculates basal metabolic rate using the Mifflin St. Jeor equation
    def self.calculate_user_bmr(user)
        if user.gender == "male"
        bmr = (10 * (user.weight * 0.4535934)) + (6.25 * (user.height * 2.54)) - (5 * user.age) + 5
        elsif user.gender == "female"
        bmr = (10 * (user.weight * 0.4535934)) + (6.25 * (user.height * 2.54)) - (5 * user.age) - 161
        end
        return bmr.to_i
    end



Harris Benedict Formula
To determine your total daily calorie needs, multiply your BMR by the appropriate activity factor, as follows:

If you are sedentary (little or no exercise) : Calorie-Calculation = BMR x 1.2
If you are lightly active (light exercise/sports 1-3 days/week) : Calorie-Calculation = BMR x 1.375
If you are moderatetely active (moderate exercise/sports 3-5 days/week) : Calorie-Calculation = BMR x 1.55
If you are very active (hard exercise/sports 6-7 days a week) : Calorie-Calculation = BMR x 1.725
If you are extra active (very hard exercise/sports & physical job or 2x training) : Calorie-Calculation = BMR x 1.9