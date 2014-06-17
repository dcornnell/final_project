class Route < ActiveRecord::Base
validates_presence_of :grade_id 
has_many :attempts
has_many :ratings
belongs_to :grade
belongs_to :location
has_many :comments, as: :commentable
has_and_belongs_to_many :tags


end


