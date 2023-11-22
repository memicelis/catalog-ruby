class LibraryLister
  def list_all_books(books)
    if books.empty?
      puts 'No books in the library'
    else
      books.each do |book|
        book.label
        puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
      end
    end
  end

  def list_all_labels(labels)
    if labels.empty?
      puts 'No labels in the library'
    else
      labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def list_all_games(games)
    if games.empty?
      puts 'No games in the library'
    else
      games.each do |game|
        game.author
        puts "Publish date: #{game.publish_date}, " \
             "Multiplayer: #{game.multiplayer}, " \
             "Last played at: #{game.last_played_at}"
      end
    end
  end

  def list_all_authors(authors)
    if authors.empty?
      puts 'No authors in the library'
    else
      authors.each do |author|
        puts "First Name: #{author.first_name}, Last Name: #{author.last_name}"
      end
    end
  end
end
