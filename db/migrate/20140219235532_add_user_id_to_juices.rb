class AddUserIdToJuices < ActiveRecord::Migration
  def change
    add_column :juices, :user_id, :integer, :references => :users
  end

end
