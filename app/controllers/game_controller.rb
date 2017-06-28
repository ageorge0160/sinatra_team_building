class GameController < ApplicationController


  get '/games' do
    erb :'games/games_home'
  end



end
