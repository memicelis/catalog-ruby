require 'date'

class Item
  attr_reader :id, :genre, :author, :label
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Time.now.year
    publish_year = @publish_date.year
    years_difference = current_year - publish_year
    years_difference >= 10
  end
end
