require_relative 'auditable'

module StudioGame
	class Die
		include StudioGame::Auditable

		attr_reader :number

		# def initialize
		# 	# we want our die to always have a valid number even if it hasn't been rolled yet.
		# 	roll
		# end

		def roll
			@number = rand(1..6)
			audit
			@number 	# return the number as the caller expect a return number
		end
	end
end