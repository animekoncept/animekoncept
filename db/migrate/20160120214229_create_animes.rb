class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string    :title
      t.string    :english
      t.string    :japanese
      t.text      :synopsis
      t.date      :aired_on
      t.date      :ended_on
      t.integer   :duration
      t.string    :type_of
      t.integer   :episodes
      t.string    :rating
      t.string    :crunchyroll
      t.string    :official_site
      t.string    :wiki
      t.integer   :mal_id

      t.timestamps null: false
    end
  end
end
