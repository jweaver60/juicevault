class Juice < ActiveRecord::Base
	belongs_to :user
	has_many :favorite_juices
	has_many :favorited_by, through: :favorite_juices, source: :user
	has_many :comments
	has_many :ratings
	has_many :raters, :through => :ratings, :source => :users

	validates :name, presence: true
	validates :manufacturer, presence: true
	validates :category, presence: true
	validates :description, presence: true
	validates :vendor_url, presence: true


	def average_rating
		@value = 0
		self.ratings.each do |rating|
			@value += rating.value
		end
		@total = self.ratings.size
		@average = @value.to_f / @total.to_f
		@average.round
	end

end
