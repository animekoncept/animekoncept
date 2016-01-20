class AddFriendlyIdToProducers < ActiveRecord::Migration
  def change
    add_column :producers, :slug, :string
    add_index :producers, :slug, unique: true
  end
end
