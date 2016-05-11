class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :story
      t.integer :art
      t.integer :sound
      t.integer :character
      t.integer :enjoyment
      t.integer :overall
      t.integer :user_id
      t.integer :anime_id

      t.timestamps null: false
    end
  end
end
