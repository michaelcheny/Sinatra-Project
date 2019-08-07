require_relative './config/environment'


use Rack::MethodOverride

use UserController
use SessionsController
run ApplicationController