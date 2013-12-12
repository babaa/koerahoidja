class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :profile_photo
      t.boolean :availability
      t.text :about
      t.text :suitable_dogs
      t.text :home_description
      t.text :family
      t.text :experience

      t.timestamps
    end
  end
end
