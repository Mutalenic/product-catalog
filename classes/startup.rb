require_relative '../actions/music_actions'
require_relative '../actions/book_action'

class Startup
  def initialize
    @book_actions = BookAction.new
    @music_actions = MusicActions.new
  end

  def options_list
    puts "\nPlease choose an option by selecting a number:
    1. List all books
    2. List all musics
    3. List all lables
    4. List all genre
    5. Add a book
    6. Add a music
    7. Exit"
    choice = gets.chomp
    selection(choice.to_i)
  end

  def selection(choice)
    methods = [
      method(:booklist), method(:musiclist),
      method(:lablelist), method(:genrelist),
      method(:create_book), method(:create_music),
      method(:quit_app)
    ]
    (1..10).include?(choice) && methods[choice - 1].call
  end

  def booklist
    @book_actions.list_books
  end

  def musiclist
    @music_actions.list_musics
  end

  def gamelist
    @game_actions.list_games
  end

  def lablelist
    @book_actions.list_labels
  end

  def genrelist
    @music_actions.list_genres
  end

  def authorlist
    @game_actions.list_authors
  end

  def create_book
    @book_actions.add_book
  end

  def create_music
    @music_actions.add_a_music
  end

  def create_game
    @game_actions.add_a_game
  end

  def quit_app
    @book_actions.save_books
    @book_actions.save_labels
    @music_actions.save_musics
    @music_actions.save_genres
    puts 'Thanks for using our app'
    exit
  end

  def start
    options_list
  end
end
