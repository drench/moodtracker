class UsersHasManyFamilies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :families do |t|
      t.index [:user_id, :family_id]
      t.index [:family_id, :user_id]
    end

    existing_data = ActiveRecord::Base.connection.execute('select id, family_id from users').to_a
    existing_data.each do |pairs|
      ActiveRecord::Base.connection.execute("insert into families_users values (#{pairs['id']}, #{pairs['family_id']})")
    end

    remove_column :users, :family_id, :integer
  end
end
