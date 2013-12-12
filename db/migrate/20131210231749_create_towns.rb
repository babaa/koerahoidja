class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.integer :county_id
      t.integer :parish_id
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
