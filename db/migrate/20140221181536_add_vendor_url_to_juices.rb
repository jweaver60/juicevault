class AddVendorUrlToJuices < ActiveRecord::Migration
  def change
    add_column :juices, :vendor_url, :string
  end
end
