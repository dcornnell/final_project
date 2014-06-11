class Route < ActiveRecord::Base
validates_presence_of :grade_id 
has_many :attempts
belongs_to :grade
has_many :comments, as: :commentable
has_and_belongs_to_many :tags
def score
	self.grade.score
end

end


