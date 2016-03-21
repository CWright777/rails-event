class Event < ActiveRecord::Base
  belongs_to :location
  has_many :relations
  has_many :users, through: :relations
end
