class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.integer :zipcode
      t.date :birthday
      t.string :phone
      t.string :avatar
      t.integer :country_id
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
