class LocateUsers < ActiveRecord::Migration
  def change
    add_column :users, :county_id, :integer
    add_column :users, :parish_id, :integer
    add_column :users, :town_id, :integer
  end
end
