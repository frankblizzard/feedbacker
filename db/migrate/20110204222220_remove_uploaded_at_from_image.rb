class RemoveUploadedAtFromImage < ActiveRecord::Migration
  def self.up
    remove_column :images, :uploaded_at
  end

  def self.down
    add_column :images, :uploaded_at, :datetime
  end
end
