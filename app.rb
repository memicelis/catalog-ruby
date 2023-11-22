require_relative 'book'
require_relative 'label'
require_relative 'item'
require 'json'

class App
  def initialize
    @books = []
    @labels = []
  end
  def select_options(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_music_albums
    when '3'
      list_all_games
    when '4'
      list_all_genres
    when '5'
      list_all_labels
    when '6'
      list_all_authors
    end
  end

  def select_options_extra(option)
    case option
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      add_game
    end
  end

  def add_book
    puts 'Add title of the book you want to add'
    title = gets.chomp
    puts 'Add the color of the book'
    color = gets.chomp
    puts 'Add publish date(dd/mm/yyyy)'
    publish_date = gets.chomp
    puts 'Add publisher'
    publisher = gets.chomp
    puts 'Add cover state (good or bad)'
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    @books << book
    label = Label.new(title, color)
    @labels << label
    book.add_label(label)
    puts 'Book succesfully added'
  end

  def list_all_books
    if @books.empty?
      puts 'No books in the library'
    else
      @books.each do |book|
        label = book.label
        puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'No labels in the library'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def save_books_to_json
    books_array = []
    @books.each do |book|
      book_obj = {
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state
      }
      books_array << book_obj
    end

    return if books_array.empty?

    File.write(('./store/books.json'), JSON.pretty_generate(books_array))
  end

  def save_labels_to_json
    labels_array = []
    @labels.each do |label|
      label_obj = {
        title: label.title,
        color: label.color
      }
      labels_array <<label_obj
    end
    return if labels_array.empty?

    File.write(('./store/labels.json'), JSON.pretty_generate(labels_array))
  end

  def load_labels_from_json
    @labels = []
    return @labels unless File.exist?('./store/labels.json')

    file = File.open('./store/labels.json')
    data = JSON.parse(file.read)

    data.each do |label|
      @labels << Label.new(label['title'],label['color'])
    end
    file.close
    @labels
  end

  def load_books_from_json
    @books = []
    return @books unless File.exist?('./store/books.json')

    file = File.open('./store/books.json')
    data = JSON.parse(file.read)
    
    data.each do |book|
      @books << Book.new(book['publish_date'], book['publisher'],book['cover_state'])
    end
    file.close
    @books
  end

end
