class AddWikiToAnimes < ActiveRecord::Migration
  def change
    add_column :animes, :wiki, :string
  end
end
