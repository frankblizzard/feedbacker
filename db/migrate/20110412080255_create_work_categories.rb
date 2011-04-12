class CreateWorkCategories < ActiveRecord::Migration
  def self.up
    create_table :work_categories do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :work_categories
  end
end
