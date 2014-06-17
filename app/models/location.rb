class Location < ActiveRecord::Base
  has_many :routes
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  has_many :comments, as: :commentable
end