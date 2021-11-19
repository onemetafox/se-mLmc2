class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :time
      t.text :description

      t.timestamps
      t.belongs_to :user, foreign_key: true
    end
  end
end
