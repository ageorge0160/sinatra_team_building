class ApplicationController < Sinatra::Base
  # register Sinara::ActiveRecordExtension

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :index
  end

end
