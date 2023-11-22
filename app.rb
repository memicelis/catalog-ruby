require_relative 'book'
require_relative 'label'
require_relative 'item'
require_relative 'author'
require_relative 'game'
require_relative 'library_lister'
require_relative 'library_manager'
require 'json'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @library_lister = LibraryLister.new
    @library_manager = LibraryManager.new
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

  def add_game
    puts 'Add first name'
    first_name = gets.chomp
    puts 'Add last name'
    last_name = gets.chomp
    puts 'Add publish date(dd/mm/yyyy)'
    publish_date = gets.chomp
    puts 'Multiplayer (state the number)'
    multiplayer = gets.chomp
    puts 'Last played at (dd/mm/yyyy)'
    last_played_at = gets.chomp

    game = Game.new(publish_date, multiplayer, last_played_at)
    @games << game
    author = Author.new(first_name, last_name)
    @authors << author
    game.add_author(author)
    puts 'Game succesfully added'
  end

  def list_all_books
    @library_lister.list_all_books(@books)
  end

  def list_all_labels
    @library_lister.list_all_labels(@labels)
  end

  def list_all_games
    @library_lister.list_all_games(@games)
  end

  def list_all_authors
    @library_lister.list_all_authors(@authors)
  end
  def save_data_to_json
    @library_manager.save_books_to_json(@books)
    @library_manager.save_labels_to_json(@labels)
    @library_manager.save_games_to_json(@games)
    @library_manager.save_authors_to_json(@authors)
  end

  def load_data_from_json
    @games = @library_manager.load_games_from_json
    @authors = @library_manager.load_authors_from_json
    @labels = @library_manager.load_labels_from_json
    @books = @library_manager.load_books_from_json
  end
  
end
