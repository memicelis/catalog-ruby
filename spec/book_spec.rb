require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('01/06/2023', 'Publisher', 'Good')
  end

  it 'has instance of class Book' do
    expect(@book).to be_instance_of Book
  end

  it 'can_be_archived to be false' do
    expect(@book.send(:can_be_archived?)).to be(false)
  end
end
