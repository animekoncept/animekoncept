class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
