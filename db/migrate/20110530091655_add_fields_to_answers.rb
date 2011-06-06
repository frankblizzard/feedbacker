class AddFieldsToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :user_id, :integer
    add_column :answers, :survey_id, :integer
  end

  def self.down
    remove_column :answers, :survey_id
    remove_column :answers, :user_id
  end
end
