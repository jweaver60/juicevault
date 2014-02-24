class Juice < ActiveRecord::Base
	belongs_to :user
	has_many :favorite_juices
	has_many :favorited_by, through: :favorite_juices, source: :user
	has_many :comments

	validates :name, presence: true
	validates :manufacturer, presence: true
	validates :category, presence: true
	validates :description, presence: true
	validates :vendor_url, presence: true

end
