class AddSeasonIdToAnimes < ActiveRecord::Migration
  def change
    add_column :animes, :season_id, :integer
  end
end
