class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :juices
  has_many :favorite_juices
  has_many :favorites, through: :favorite_juices, source: :juice
  has_many :comments
end
