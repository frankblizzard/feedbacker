class AddProjectIdToFixedCosts < ActiveRecord::Migration
  def self.up
    add_column :fixed_costs, :project_id, :integer
  end

  def self.down
    remove_column :fixed_costs, :project_id
  end
end
