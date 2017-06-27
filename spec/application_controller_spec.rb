require 'spec_helper'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome")
    end
  end

  describe "Signup Page" do

    it 'loads the signup page' do
      get '/signup'
      expect(last_response.status).to eq(200)
    end

    it 'signup directs user to game index' do
      params = {
        :username => "peanut123",
        :email => "pea@nut.com",
        :password => "elephant"
      }
      post '/signup', params
      expect(last_response.location).to include("/games")
    end
  end

end
