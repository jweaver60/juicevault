class CreateJuices < ActiveRecord::Migration
  def change
    create_table :juices do |t|
      t.string :name
      t.string :manufacturer

      t.timestamps
    end
  end
end
