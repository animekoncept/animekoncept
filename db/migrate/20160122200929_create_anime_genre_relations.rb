class CreateAnimeGenreRelations < ActiveRecord::Migration
  def change
    create_table :anime_genre_relations do |t|
      t.integer :anime_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
