class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.string :goal
      t.string :rules
      t.string :safety
      t.string :debrief_topic
      t.integer :time
    end
  end
end
