class SetDefaultForAvailability < ActiveRecord::Migration
  def up
    change_column :users, :availability, :boolean, :default => true
  end

  def down
    change_column :users, :availability, :boolean, :default => nil
  end
end
