class DropRatesAndRatingsCacheTable < ActiveRecord::Migration
  def change
  	drop_table :rates
  	drop_table :rating_caches
  end
end
