require_relative './item'

class Startup
  def options_menu
    puts " Please choose an option by selecting the number next to the option:
        1. List all books
        2. List all music albums
        3. List all genres(e.g. fiction, non-fiction, etc.)
        4. List all authors
        5. List all labels
        3. Add a book
        4. Add  music album
        5. Exit"

    choice = gets.chomp
    selection(choice.to_i)
  end

  def selection(choice)
    methods = %i[list_books list_music_albums list_genres list_authors list_labels add_book
                 add_music_album exit]
    methods[choice - 1].call
  end

  def list_books
    puts 'boook list in library'
  end

  def list_music_albums
    puts 'music album list in library'
  end

  def list_genres
    puts 'genre list in library'
  end

  def list_authors
    puts 'author list in library'
  end

  def list_labels
    puts 'label list in library'
  end

  def add_book
    puts 'add book to library'
  end

  def add_music_album
    puts 'add music album to library'
  end

  def exit
    puts 'Thank you for using the product catalog app'
  end

  def start
    options_menu
  end
end
