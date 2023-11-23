require_relative '../game'

describe Game do
  before :each do
    @game = Game.new('01/06/2023', '4', '01/07/2023')
  end

  it 'has instance of class' do
    expect(@game).to be_instance_of Game
  end

  it 'can_be_archived to be false' do
    expect(@game.send(:can_be_archived?)).to be(false)
  end
end
