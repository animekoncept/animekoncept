class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :name
      t.text :synopsis
      t.date :aired_on
      t.date :ended_on
      t.string :duration

      t.timestamps null: false
    end
  end
end
