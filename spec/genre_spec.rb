require_relative '../genre'

describe Genre do
  before :each do
    @genre = Genre.new('Name')
    @item = Item.new('01/07/2023')
  end

  it 'has instance of class' do
    expect(@genre).to be_instance_of Genre
  end

  it 'add item to genre' do
    @genre.add_item(@item)
    expect(@item.genre).to eq(@genre)
    expect(@genre.items).to include(@item)
  end
end
