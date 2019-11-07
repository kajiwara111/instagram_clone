class DropTableFavorites2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :table_favorites
  end
end
