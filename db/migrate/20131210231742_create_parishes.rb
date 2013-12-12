class CreateParishes < ActiveRecord::Migration
  def change
    create_table :parishes do |t|
      t.integer :county_id
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
