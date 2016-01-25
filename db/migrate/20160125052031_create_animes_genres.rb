class CreateAnimesGenres < ActiveRecord::Migration
  def change
    create_table :animes_genres do |t|
      t.integer :anime_id
      t.integer :genre_id
    end
  end
end
