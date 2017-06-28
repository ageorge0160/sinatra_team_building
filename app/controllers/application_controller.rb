class ApplicationController < Sinatra::Base
  # register Sinara::ActiveRecordExtension

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
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

      get 'signup' do
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

      get '/logout' do
          if logged_in?
            session.clear
            redirect '/login'
          else
            redirect ''
          end
        end

        get '/games' do
          erb :'/games/games_home'
        end


end
