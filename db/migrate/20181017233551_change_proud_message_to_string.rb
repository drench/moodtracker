class ChangeProudMessageToString < ActiveRecord::Migration[5.2]
  def change
    change_column :mood_trackers, :proud_message, :string
  end
end
