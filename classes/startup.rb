require_relative '../actions/book_action'
require_relative '../actions/music_actions'

class Startup
  def initialize
    @book_action = BookAction.new
    @music_actions = MusicActions.new
  end

  def options_menu
    puts " Please choose an option by selecting the number next to the option:
        1. List all books
        2. List all music albums
        3. List all genres(e.g. fiction, non-fiction, etc.)
        4. List all authors
        5. List all labels
        6. Add a book
        7. Add  music album
        8. Exit"

    choice = gets.chomp
    selection(choice.to_i)
  end

  def selection(choice)
    methods = [
      method(:list_books),
      method(:list_music_albums),
      method(:list_genres),
      method(:list_authors),
      method(:list_labels),
      method(:add_book),
      method(:add_music_album),
      method(:exit_app)
    ]
    (1..8).include?(choice) && methods[choice - 1].call
  end

  def list_books
    @book_action.list_books
  end

  def list_music_albums
    @music_action.list_music_albums
  end

  def list_genres
    @music_action.list_genres
  end

  def list_labels
    @book_action.list_labels
  end

  def list_authors
    @music_action.list_authors
  end

  def add_book
    @book_action.add_book
  end

  def add_music_album
    @music_action.add_music_album
  end

  def exit_app
    @book_actions.save_books
    @music_actions.save_music_albums
    @music_actions.save_genres
    @music_actions.save_authors
    @music_actions.save_labels
    puts 'Goodbye!'
    exit
  end

  def start
    options_menu
  end
end
