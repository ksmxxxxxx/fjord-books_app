class RenameColumnNameOfUserName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :name, :user_name
    rename_column :users, :user_name, :name
  end
end
