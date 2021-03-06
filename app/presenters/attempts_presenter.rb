class AttemptsPresenter
	attr_accessor :collect_grades, :attempts
	def initialize(attempts)
		@attempts = attempts
		@grades = []
		@grade_names = Hash.new(0)
		@tags = []
		@tag_names = Hash.new(0)
	end

	def collect_grades
		@attempts.each do |g|

		 	@grades << g.route.grade.name
	
		end
		@grades.each do |n|
			@grade_names[n] += 1
		end
		return @grade_names
	end

	def collect_tags
		@attempts.each do |attempt|
			attempt.route.tags.each do |tag|
				@tags << tag.name
				end
			end
			@tags.each do |n|
			@tag_names[n] += 1
			end
			return @tag_names
	end

	



end
