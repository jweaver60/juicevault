class FavoriteJuice < ActiveRecord::Migration
  def change
  	  create_table :favorite_juices do |t|
      t.integer :user_id
      t.integer :juice_id

      t.timestamps
  end
end
