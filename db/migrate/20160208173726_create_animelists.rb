class CreateAnimelists < ActiveRecord::Migration
  def change
    create_table :animelists do |t|
      t.references :user, index: true, foreign_key: true
      t.references :anime, index: true, foreign_key: true
      t.string :status
      t.integer :episodes_watched, :default => 0
      t.integer :rating, :default => 0
      t.integer :rewatched, :default => 0

      t.timestamps null: false
    end
  end
end
