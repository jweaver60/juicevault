class AddImageToJuices < ActiveRecord::Migration
  def change
    add_column :juices, :image_url, :string
  end
end
