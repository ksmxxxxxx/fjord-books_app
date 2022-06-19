class ChangeUsernamedatatypeToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :user_name, false, ""
    change_column_default :users, :user_name, from: nil, to: ""
  end
end
