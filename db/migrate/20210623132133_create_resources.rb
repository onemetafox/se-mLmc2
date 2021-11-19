class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :date
      t.string :time
      t.text :description

      t.timestamps
    end
  end
end
