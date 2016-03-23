class AddHeaderImageToEvents < ActiveRecord::Migration
  def up
    add_attachment :events, :header_image
  end

  def down
    remove_attachment :events, :header_image
  end
end
