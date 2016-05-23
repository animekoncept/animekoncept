class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string   :name
      t.text     :synopsis
      t.date     :aired_on
      t.date     :ended_on
      t.string   :duration
      t.string   :crunchyroll
      t.string   :official_site
      t.string   :wiki
      t.string   :type_of
      t.integer   :mal_id

      t.timestamps null: false
    end
  end
end
