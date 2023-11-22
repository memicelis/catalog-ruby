require 'json'

class LibraryManager
    def save_books_to_json(books)
        books_array = []
        books.each do |book|
          book_obj = {
            publish_date: book.publish_date,
            publisher: book.publisher,
            cover_state: book.cover_state
          }
          books_array << book_obj
        end
    
        return if books_array.empty?
    
        File.write('./store/books.json', JSON.pretty_generate(books_array))
      end
    
      def save_labels_to_json(labels)
        labels_array = []
        labels.each do |label|
          label_obj = {
            title: label.title,
            color: label.color
          }
          labels_array << label_obj
        end
        return if labels_array.empty?
    
        File.write('./store/labels.json', JSON.pretty_generate(labels_array))
      end
    
      def save_games_to_json(games)
        games_array = []
        games.each do |game|
          game_obj = {
            publish_date: game.publish_date,
            multiplayer: game.multiplayer,
            last_played_at: game.last_played_at
          }
          games_array << game_obj
        end
    
        return if games_array.empty?
    
        File.write('./store/games.json', JSON.pretty_generate(games_array))
      end
    
      def save_authors_to_json(authors)
        authors_array = []
        authors.each do |author|
          author_obj = {
            first_name: author.first_name,
            last_name: author.last_name
          }
          authors_array << author_obj
        end
    
        return if authors_array.empty?
    
        File.write('./store/authors.json', JSON.pretty_generate(authors_array))
      end
    
      def load_games_from_json
        games = []
        return games unless File.exist?('./store/games.json')
    
        file = File.open('./store/games.json')
        data = JSON.parse(file.read)
    
        data.each do |game|
          games << Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
        end
    
        file.close
        games
      end
    
      def load_authors_from_json
        authors = []
        return authors unless File.exist?('./store/authors.json')
    
        file = File.open('./store/authors.json')
        data = JSON.parse(file.read)
    
        data.each do |author|
          authors << Author.new(author['first_name'], author['last_name'])
        end
    
        file.close
        authors
      end
    
      def load_labels_from_json
        labels = []
        return labels unless File.exist?('./store/labels.json')
    
        file = File.open('./store/labels.json')
        data = JSON.parse(file.read)
    
        data.each do |label|
          labels << Label.new(label['title'], label['color'])
        end
        file.close
        labels
      end
    
      def load_books_from_json
        books = []
        return books unless File.exist?('./store/books.json')
    
        file = File.open('./store/books.json')
        data = JSON.parse(file.read)
        data.each do |book|
          books << Book.new(book['publish_date'], book['publisher'], book['cover_state'])
        end
        file.close
        books
      end
end

