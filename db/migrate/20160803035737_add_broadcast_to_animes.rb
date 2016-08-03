class AddBroadcastToAnimes < ActiveRecord::Migration
  def change
    add_column :animes, :broadcast, :datetime
  end
end
