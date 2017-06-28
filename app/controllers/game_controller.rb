class GameController < ApplicationController


  get '/games' do
    if logged_in?
      erb :'games/games_home'
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
