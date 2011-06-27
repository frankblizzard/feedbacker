class CreateKeyDatas < ActiveRecord::Migration
  def self.up
    create_table :key_datas do |t|
      t.string :name
      t.float :percentage
      t.timestamps
    end
  end

  def self.down
    drop_table :key_datas
  end
end
