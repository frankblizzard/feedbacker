class AddHourlyRateToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :hourly_rate, :float, :default => 1
  end

  def self.down
    remove_column :users, :hourly_rate
  end
end
