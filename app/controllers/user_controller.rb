class UserController < ApplicationController

  get '/signup' do
      if logged_in?
        redirect '/games'
      else
        erb :'/users/new_user'
      end
    end

    get '/login' do
    if logged_in?
      redirect '/games'
    else
      erb :'/users/login'
    end
  end

end
