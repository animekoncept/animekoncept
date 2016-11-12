class AddImagesToGroups < ActiveRecord::Migration
  def up
    add_attachment :groups, :avatar
    add_attachment :groups, :header_image
  end

  def down
    remove_attachment :groups, :avatar
    remove_attachment :groups, :header_image
  end
end
