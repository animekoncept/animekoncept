class AddAnimeIdToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :anime_id, :integer
  end
end
