require_relative 'game'
require_relative 'die'

describe Game do
	before do
		@game = Game.new('Knuckleheads')

		@initial_health = 100
		@player = Player.new('moe', @initial_health)

		@game.add_player(@player)
	end

	it 'woots the player if a high number is rolled' do
		Die.any_instance.stub(:roll).and_return(5)

		@game.play(2)

		@player.health.should == @initial_health + (15 * 2)
	end

	it 'skips the player if as medium number is rolled' do
		Die.any_instance.stub(:roll).and_return(3)

		@game.play(2)

		@player.health.should == @initial_health
	end

	it 'blam the player if a low number is rolled' do
		Die.any_instance.stub(:roll).and_return(1)

		@game.play(2)

		@player.health.should == @initial_health - (10 * 2)
	end
end