class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :name
      t.integer :project_id
      t.datetime :uploaded_at
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
