class CreateMoodTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :mood_trackers do |t|
      t.integer :emotion
      t.integer :user_id
      t.integer :proud_message

      t.timestamps
    end
  end
end
