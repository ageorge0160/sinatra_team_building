class Game < ActiveRecord::Base

  belongs_to :user

  validates :title, :description, :goal, :rules, :safety, :debrief_topic, presence: true

end
