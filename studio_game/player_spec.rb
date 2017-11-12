require_relative 'player'

# describe - example group
describe Player do 
	# to share common setup code accross code examples
	# before method runs once before each of the example
	before do
		# variable global always start with $
		# $stdout by default is set to an input/output object that prints to the console.
		# we override it by assigning a StringIO object (it reads and writes to strings rather than the console)
		$stdout = StringIO.new
		@initial_health = 150
		@player = Player.new('larry', @initial_health)
	end

	# it - define a code example
	it 'has a capitalized name' do
		@player.name.should == 'Larry'
	end

	it 'has an intial health' do
		@player.health.should == 150
	end

	it 'has a string representation' do
		@player.to_s.should == "I'm Larry with a health of 150 and a score of 155."
	end

	it 'computes a score as the sum of its health and length of name' do
		@player.score.should == (150 + @player.name.length)
	end	

	it 'increases health by 15 when wooted' do
		@player.woot

		@player.health.should == (@initial_health + 15)
	end

	it 'decreases health by 10 when blammed' do
		@player.blam

		@player.health.should == (@initial_health - 10)
	end
end