class FavoriteJuice < ActiveRecord::Base
	belongs_to :juice
	belongs_to :user
end