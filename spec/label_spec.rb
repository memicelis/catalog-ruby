require_relative '../label'

describe Label do
  before :each do
    @label = Label.new('Title', 'Color')
    @item = Item.new('01/06/2023')
  end

  it 'has instance of class' do
    expect(@label).to be_instance_of Label
  end

  it 'adds item to label' do
    @label.add_item(@item)
    expect(@label.items).to include(@item)
    expect(@item.label).to eq(@label)
  end
end
