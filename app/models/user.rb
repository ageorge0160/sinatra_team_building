class User < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :games
  has_secure_password

  validates :username, :email, presence: true

end
