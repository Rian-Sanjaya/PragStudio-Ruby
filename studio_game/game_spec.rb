require_relative 'game'
require_relative 'die'

describe Game do
	before do
		@game = Game.new('Knuckleheads')

		@initial_health = 100
		@player = Player.new('moew', @initial_health)

		@game.add_player(@player)
	end

	it 'woots the player if a high number is rolled' do
		Die.any_instance.stub(:roll).and_returns(5)

		@game.play

		@player.health.should == @initial_health + 15
	end

	it 'skips the player if as medium number is rolled' do
		Die.any_instance.stub(:roll).and_returns(3)

		@game.play

		@player.health.should == @initial_health
	end

	it 'blam the player if a low number is rolled' do
		Die.any_instance.stub(:roll).and_returns(1)

		@game.play

		@player.health.should == @initial_health - 10
	end
end