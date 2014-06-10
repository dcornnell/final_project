class Tag < ActiveRecord::Base
has_and_belongs_to_many :routes
validates_presence_of :name
validates_length_of :name, :maximum => 12
end

