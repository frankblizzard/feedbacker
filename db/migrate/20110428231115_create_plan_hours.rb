class CreatePlanHours < ActiveRecord::Migration
  def self.up
    create_table :plan_hours do |t|
      t.float :amount
      t.integer :project_id
      t.integer :work_category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :plan_hours
  end
end
