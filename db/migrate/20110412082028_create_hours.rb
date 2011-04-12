class CreateHours < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.date :date
      t.float :amount
      t.text :task
      t.boolean :extra
      t.integer :user_id
      t.integer :project_id
      t.integer :work_category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :hours
  end
end
