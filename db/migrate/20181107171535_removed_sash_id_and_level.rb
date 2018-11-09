class RemovedSashIdAndLevel < ActiveRecord::Migration[5.2]
  def change
    remove_column :badges, :sash_id, :integer
    remove_column :badges, :level, :integer
  end
end
