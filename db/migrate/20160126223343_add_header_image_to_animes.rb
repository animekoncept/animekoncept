class AddHeaderImageToAnimes < ActiveRecord::Migration
  def up
    add_attachment :animes, :header_image
  end

  def down
    remove_attachment :animes, :header_image
  end
end
