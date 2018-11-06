class AddMeritFieldsToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :sash_id, :integer
    add_column :badges, :level,   :integer, :default => 0
  end
end
