class GameController < ApplicationController

  get '/games' do
    erb :'/games/games'
  end


end
