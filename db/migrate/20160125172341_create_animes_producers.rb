class CreateAnimesProducers < ActiveRecord::Migration
  def change
    create_table :animes_producers do |t|
      t.integer :anime_id
      t.integer :producer_id
    end
  end
end
