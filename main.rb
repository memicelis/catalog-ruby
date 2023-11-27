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
    puts '7. Add a book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '10. Quit'
  end

  def start
    new_app = App.new
    new_app.load_data_from_json
    loop do
      show_options
      option = gets.chomp
      break if option == '10'

      new_app.select_options(option)
      new_app.select_options_extra(option)
    end
    new_app.save_data_to_json
    puts 'You have exited the catalog of things'
  end
end

def main
  app = Main.new
  app.start
end

main
