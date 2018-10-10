class CreateMessageThreads < ActiveRecord::Migration[5.2]
  def change
    create_table :message_threads do |t|

      t.timestamps
    end
  end
end
