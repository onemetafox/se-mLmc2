class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :date
      t.string :time
      t.text :description

      t.timestamps
    end
  end
end
