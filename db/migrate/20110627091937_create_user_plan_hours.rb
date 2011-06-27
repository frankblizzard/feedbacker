class CreateUserPlanHours < ActiveRecord::Migration
  def self.up
    create_table :user_plan_hours do |t|
      t.integer :user_id
      t.integer :project_id      
      t.float :amount
      t.float :individual_costs
      t.float :burden_costs
      t.float :total_costs
      t.timestamps
    end
  end

  def self.down
    drop_table :user_plan_hours
  end
end
