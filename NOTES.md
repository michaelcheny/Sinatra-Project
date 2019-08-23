


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


To determine your total daily calorie needs, multiply your BMR by the appropriate activity factor, as follows:

If you are sedentary (little or no exercise) : Calorie-Calculation = BMR x 1.2
If you are lightly active (light exercise/sports 1-3 days/week) : Calorie-Calculation = BMR x 1.375
If you are moderatetely active (moderate exercise/sports 3-5 days/week) : Calorie-Calculation = BMR x 1.55
If you are very active (hard exercise/sports 6-7 days a week) : Calorie-Calculation = BMR x 1.725
If you are extra active (very hard exercise/sports & physical job or 2x training) : Calorie-Calculation = BMR x 1.9



## KNOWLEDGE REQUIREMENTS

- MVC
	- What is MVC?
		Model View Controller

	- Why do we use it?
		It creates a separation of concerns where groups of files have specific jobs. Models is where data is manipulated, views is the front-end where users will see, controllers are the middleman.

	- Does everything we need fit inside MVC?
		We still got our config, environment files, gemfiles, etc

	- How does this affect our file structure?
		Keeps our code very organized, each file will have a different responsibility. Seperated presentation.


- CRUD
	- What is CRUD?
		Create (SQL: INSERT, HTTP: POST)
    Read (SQL: SELECT, HTTP: GET)
    Update (SQL: UPDATE, HTTP: PATCH)
    Delete (SQL: DELETE, HTML: DELETE)


REST
- What is REST?
	Representational State Transfer. It’s an architectural style that web applications using HTTP should follow. Looking something up should use GET requests, creating stuff uses POST requests, updating things uses PATCH/PUT, and deleting stuff uses DELETE requests.

- Why do we use it?
	It makes things simple af. It provides mapping between HTTP verbs like get, post, delete, patch, to controller CRUD actions. Whenever our web app receives an HTTP request, it matches that request to the right controller action. Boom.

- CRUD actions are different actions that occur on the same resource. If we want to view item 6, we make a GET request to /item/6, but if we want to update it, it's gonna be a PUT/PATCH request to the same /item/6 route. 


Environment Variables

- What are they? 
	It’s kind of like a hash with a key/value pair (KEY=VALUE) that we use to share configurations between programs, like making our app start in test/development/production mode. Can also tell our OS where to look for binary files, or telling Ruby where to look for gems. We use `env` in the terminal to see a list.


Sessions/Cookies

- What are cookies? 
	It's a hash of data that gets stored in the browser to store data. It gets sent back to the server at every request to let the server remember you.

- What are sessions?
	It’s similar to a cookie but more on the server-side usage for temporarily saving data while the user browses. 

- How did we use them?
	We did that set SESSION_SECRET = ENV['SESSION_SECRET'] thing


- 12 Factor Apps?
	It stores config in environment variables. Which allows easy change between deploys (production, development, staging, etc) without changing any code.


Sinatra Basics

	- How to enable sessions?
		Within our ApplicationController class, in the configure do block, “enable :sessions”

	- How to set up a database?
		In our env file, `ActiveRecord::Base.establish_connection` block, `:database => “db/#{ENV[‘SINATRA_ENV’].sqlite”`. 

    ```ruby
    configure :development do
    set :database, 'sqlite3:db/database.db'
    end
    ```
	
	- How to ensure all our gems are being used?
		Gemfile?

	- What gem enables database password encryption? 
		Bcrypt
	
	- Why do we encrypt our passwords in the database?
		So bad people can’t guess and steal??

	- What are helpers and why do we use them?
		Helpful methods placed in a helpers do block in our application controller, and we use them so we don’t have to throw a bunch of logic in a view which makes it messy af. Instead we can abstract it into a helper method. 
	
	- How do we make helpers?
		In ApplicationController class, we set up a helpers do end block

	- How to create migrations?
		rake db:create_migration NAME=create_whatever
	
	- How to set up has_many and belongs_to relationship vs a has_many to has_many in sql/activerecord
		class Dog belongs to class Owner, class Owner has many dogs 


	class Assembly has_many_and_belongs_to_many :parts
  class Part has_and_belongs_to_many :assemblies

  We can also do a many_to_many using has_many :through to make the association indirectly, through a join model.

- How to rescue an error in Ruby?
    We wrap our code that raises the error in a  `begin`/`rescue` block. 
    ```ruby
    begin
      #code we are trying to run and may break on us
    rescue
      puts "this will fuck up"
    end
    ```

- Difference between authentication and authorization?
    authentication authenticates the current user, checks if they're logged in and if they are the current user, else we can kick or redirect them to login

    authorization checks if they are authorized for action, like authorizing a user for editing something.

- Walk through the logical progession process of a user asking for an HTML form to data being changed in the database (include user input validation and authentication/authorization)
    User clicks on a link, or types in an HTML, that triggers a get request, then when they input whatever in the form, and submit, that triggers a post request. The post request then says wassap to the controller, it goes in has params and has to get through authentication or authorization, then the input validation will get triggered whenever a `.save` or `.update` method is called.

- What is Rack?
    A gem - a Ruby Webserver Interface, that helps us create a web server at its simplest form. The building block of rails. Has a config rackup file.

- What is Rake used for? How to make a Rake task?
    A task runner used in Ruby. We use it for stuff like - making backups of our db, running our tests, gathering and reporting stats. It helps the Ruby servers and frameworks work together
    rake -t to see a list

    to make a rake task, we need a rakefile, we can do something like:
    ```ruby
        task :console do
        Pry.start
        end

        rake console
    ```

- How to use a .gitignore correctly?
    `touch .gitignore` then write the name of the files you want git to ignore when you add/push

- What methods do ActiveRecord give you? How do we access associations? Show in rake console.
    It gives us a bunch of methods like .create, .find, .new, .save, .update, .destroy_all, etc.
    ```
    u = User.find_by_id(1)
    u.update(name: "Woogie Boogie")
    u.delete
    ```

    We can do something like:
    ```ruby
    dude = Owner.create(name: "Human")
    woof = Dog.new(name: "Bark")
    woof.owner = dude
    woof.save
    ```
    This is of course after our associations are set up in the classes and tables

- What Http methods are idempotent?
    Idempotent methods are HTTP methods that can be called many times without different outcomes. (`a = 4` yes, `a++` no)

    GET, DELETE are idempotent, POST, PATCH are not.
