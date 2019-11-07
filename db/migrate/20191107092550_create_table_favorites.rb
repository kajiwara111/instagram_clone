class CreateTableFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :table_favorites do |t|
      t.bigint :user_id
      t.bigint :feed_id
    end
  end
end
