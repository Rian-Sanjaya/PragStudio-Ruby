require_relative 'auditable'

module StudioGame
	class LoadedDie
		include StudioGame::Auditable
		
		attr_reader :number

		def roll
			numbers = [1, 1, 2, 5, 6, 6]
			@number = numbers.sample		# pick a random element from array
			audit
			@number
		end
	end
end