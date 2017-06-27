class UserController < ApplicationController

  get '/signup' do
      if logged_in?
        redirect '/games'
      else
        erb :'/users/new_user'
      end
    end

end
