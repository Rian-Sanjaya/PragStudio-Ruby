class Die
	attr_reader :number

	def initialize
		# we want our die to always have a valid number even if it hasn't been rolled yet.
		roll
	end

	def roll
		@number = rand(1..6)
	end
end