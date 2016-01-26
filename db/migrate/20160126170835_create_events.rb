class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.date :starts_on
      t.date :ends_on
      t.string :age

      t.timestamps null: false
    end
  end
end
