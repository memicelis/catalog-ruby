require_relative '../author'

describe Author do
  before :each do
    @author = Author.new('Name', 'Surname')
    @item = Item.new('01/07/2023')
  end

  it 'has instance of class' do
    expect(@author).to be_instance_of Author
  end

  it 'adds item to author' do
    @author.add_item(@item)
    expect(@author.items).to include(@item)
    expect(@item.author).to eq(@author)
  end
end
