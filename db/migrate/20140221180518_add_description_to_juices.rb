class AddDescriptionToJuices < ActiveRecord::Migration
  def change
    add_column :juices, :description, :text
  end
end
