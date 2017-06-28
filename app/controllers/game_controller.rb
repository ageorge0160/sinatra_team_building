class GameController < ApplicationController

  get '/games' do
    if logged_in?
      erb :'games/games_home'
    else
      redirect ''
    end
  end

  

  get '/games/:id/edit' do
    if logged_in?
      erb :'games/edit_game'
    else
      redirect ''
    end
  end

# Helper Methods
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
