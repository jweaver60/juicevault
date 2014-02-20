class Juice < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :manufacturer, presence: true
end
