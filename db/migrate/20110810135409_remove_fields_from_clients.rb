class RemoveFieldsFromClients < ActiveRecord::Migration
  def self.up
    remove_column :clients, :phone
    remove_column :clients, :email
    remove_column :clients, :contact_person
  end

  def self.down
    add_column :clients, :contact_person, :string
    add_column :clients, :email, :string
    add_column :clients, :phone, :string
  end
end
