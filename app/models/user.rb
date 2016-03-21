class User < ActiveRecord::Base
  has_secure_password
  belongs_to :location
  has_many :relations
  has_many :events, through: :relations
end
