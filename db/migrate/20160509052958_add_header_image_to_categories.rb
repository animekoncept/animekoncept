class AddHeaderImageToCategories < ActiveRecord::Migration
  def up
    add_attachment :categories, :header_image
  end

  def down
    remove_attachment :categories, :header_image
  end
end
