require './config/environment'

use Rack::MethodOverride
use GameController
use UserController
run ApplicationController
