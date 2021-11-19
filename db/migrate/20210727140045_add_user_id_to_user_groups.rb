class AddUserIdToUserGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :user_groups, :user_id, :int
  end
end
