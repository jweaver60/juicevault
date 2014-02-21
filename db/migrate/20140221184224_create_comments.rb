class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :juice_id

      t.timestamps
    end
    add_index :comments, [:user_id, :juice_id]
  end
end
