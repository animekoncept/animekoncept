class AddTypeOfToAnimes < ActiveRecord::Migration
  def change
    add_column :animes, :type_of, :string
  end
end
