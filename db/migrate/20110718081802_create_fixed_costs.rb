class CreateFixedCosts < ActiveRecord::Migration
  def self.up
    create_table :fixed_costs do |t|
      t.string :name
      t.float :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :fixed_costs
  end
end
