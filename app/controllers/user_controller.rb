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
      redirect '/login'
    else
      erb :'/users/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect ''
    end
  end

  post '/signup' do
    if params["username"] != nil && params["email"] != nil && params["password"] != nil
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect '/games'
    else
      redirect '/signup'
    end
  end

  post '/login' do
    @user = User.find(username: params["username"])
    if @user && @user.authenticate(params["password"])
      session[:user_id] = @user.id
      redirect "/games"
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
