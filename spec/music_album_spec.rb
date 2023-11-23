require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @musicalbum = MusicAlbum.new('01/06/2023', true)
  end

  it 'has instance of class' do
    expect(@musicalbum).to be_instance_of MusicAlbum
  end

  it 'can_be_archived to be false' do
    expect(@musicalbum.send(:can_be_archived?)).to be(false)
  end
end
