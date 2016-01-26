class AddHeaderImageToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :header_image
  end

  def down
    remove_attachment :users, :header_image
  end
end
