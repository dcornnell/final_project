class Route < ActiveRecord::Base
validates_presence_of :grade_id 
has_many :attempts
belongs_to :grade

def score
	self.grade.score
end

end


