class AddImageIdToSurvey < ActiveRecord::Migration
  def self.up
    add_column :surveys, :image_id, :integer
  end

  def self.down
    remove_column :surveys, :image_id
  end
end
