require_relative 'app'

class Main
  puts 'Welcome to our catalog app'

  def show_options
    puts "\nOptions:"
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. List all sources'
    puts '8. Add a book'
    puts '9. Add a music album'
    puts '10. Add a movie'
    puts '11. Quit'
  end

  def start
    new_app = App.new
    loop do
      show_options
      option = gets.chomp
      break if option == '11'

      new_app.list_options(option)
      new_app.add_options(option)
    end
  end
end

def main
  app = Main.new
  app.start
end

main
