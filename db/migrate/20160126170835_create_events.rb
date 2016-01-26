class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.date :date_on
      t.datetime :start_at
      t.datetime :end_at
      t.string :age

      t.timestamps null: false
    end
  end
end
