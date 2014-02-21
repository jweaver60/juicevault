class AddCategoryToJuices < ActiveRecord::Migration
  def change
    add_column :juices, :category, :string
  end
end
