class AddOfficialSiteToAnimes < ActiveRecord::Migration
  def change
    add_column :animes, :official_site, :string
  end
end
