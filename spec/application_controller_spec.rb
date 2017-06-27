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

    it 'does not let a user sign up without a username' do
      params = {
        :username => "",
        :email => "pea@nut.com",
        :password => "elephant"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without an email' do
      params = {
        :username => "peanut123",
        :email => "",
        :password => "elephant"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without a password' do
      params = {
        :username => "peanut123",
        :email => "pea@nut.com",
        :password => ""
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a logged in user view the signup page' do
      user = User.create(:username => "peanut123", :email => "pea@nut.com", :password => "elephant")
      params = {
        :username => "peanut123",
        :email => "pea@nut.com",
        :password => "elephant"
      }
      post '/signup', params
      session = {}
      session[:user_id] = user.id
      get '/signup'
      expect(last_response.location).to include('/games')
    end

end
