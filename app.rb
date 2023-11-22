class App
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
      list_all_sources
    when '8'
      add_book
    when '9'
      add_music_album
    when '10'
      add_movie
    end
  end
end
