class RemoveTimeFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups, :time, :string
  end
end
