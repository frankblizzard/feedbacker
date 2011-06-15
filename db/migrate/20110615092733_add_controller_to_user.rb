class AddControllerToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :controller, :boolean
  end

  def self.down
    remove_column :users, :controller
  end
end
