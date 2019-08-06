class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hubbadubba"
  end

  get '/' do
    "Pssssst! hail hydra"
  end

end