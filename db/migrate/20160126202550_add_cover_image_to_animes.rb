class AddCoverImageToAnimes < ActiveRecord::Migration
  def up
    add_attachment :animes, :cover_image
  end

  def down
    remove_attachment :animes, :cover_image
  end
end
