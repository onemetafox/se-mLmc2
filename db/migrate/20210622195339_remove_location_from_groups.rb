class RemoveLocationFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups, :location, :string
  end
end
