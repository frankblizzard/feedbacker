class AddHolidayToHours < ActiveRecord::Migration
  def self.up
    add_column :hours, :holiday, :boolean
  end

  def self.down
    remove_column :hours, :holiday
  end
end
