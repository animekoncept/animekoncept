class AddFriendlyIdToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :slug, :string
    add_index :seasons, :slug, unique: true
  end
end
