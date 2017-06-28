class GameController < ApplicationController

  get '/games' do
    if logged_in?
      erb :'games/games_home'
    else
      redirect ''
    end
  end

  get '/games/new' do
    if logged_in?
      erb :'games/new_game'
    else
      redirect ''
    end
  end

  get '/games/:id' do
    if logged_in?
      @game = Game.find(params[:id])
      erb :'games/show_game'
    else
      redirect ''
    end
  end

  get '/games/:id/edit' do
    if logged_in?
      @game = Game.find(params[:id])
      erb :'games/edit_game'
    else
      redirect ''
    end
  end

  post '/games/new' do
    game = Game.new(params)
    game.user_id = current_user.id
    game.save
    redirect "/games/#{game.id}"
  end


    patch '/games/:id' do
      game = Game.find(params[:id])
      if game.user == current_user
        game.title = params["title"]
        game.description = params["description"]
        game.goal = params["goal"]
        game.rules = params["rules"]
        game.safety = params["safety"]
        game.debrief_topic = params["debrief_topic"]
        game.time = params["time"]
        game.save
        redirect "/games/#{game.id}"
      else
        erb :'games/games_home'
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
