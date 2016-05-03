class AddCrunchyrollLinkToAnimes < ActiveRecord::Migration
  def change
    add_column :animes, :crunchyroll, :string
  end
end
