class AddDescriptionToUserPlanHours < ActiveRecord::Migration
  def self.up
    add_column :user_plan_hours, :description, :string
  end

  def self.down
    remove_column :user_plan_hours, :description
  end
end
