require './classes/music_album'
require './classes/genre'
require 'json'

class MusicActions
    attr_accessor :music_albums, :genres

    def initialize
        @music_albums = load_music_albums
        @genres = load_genres
    end

    def add_music_album
        puts 'Publish date (YYYY-MM-DD): '
        publish_date = gets.chomp

        puts 'Archived: (true/false)'
        archived = gets.chomp.downcase == 'true'

        puts 'On Spotify: (true/false)'
        on_spotify = gets.chomp.downcase == 'true'

        music_album = MusicAlbum.new(publish_date, archived, on_spotify)
        @music_albums.push(to_hash(music_album))

        puts 'what genre do you want to add this album to?'
        genre_name = gets.chomp
        genre = @genres.find { |genre| genre['name'] == genre_name }
        genre['items'].push(music_album.id)
        puts "\nMusic album created successfully!!!\n"
        end

    def list_music_albums
        if @music_albums.empty?
            puts 'No music album in library'
        else
            @music_albums.each do |music_album|
                puts "
                Music album ID: #{music_album['id']}
                Publish date: #{music_album['publish_date']}
                Archived: #{music_album['archived']}
                On Spotify: #{music_album['on_spotify']}
                "
            end
        end
    end

    def list_genres
        if @genres.empty?
            puts 'No genre in library'
        else
            @genres.each do |genre|
                puts "
                Genre ID: #{genre['id']}
                Name: #{genre['name']}
                "
            end
        end
    end

    def load_music_albums
        file = './data/music_albums.json'
        data = []
        if File.exist?(file)
            JSON.parse(File.read(file)).each do |music_album|
                data.push(MusicAlbum.new(music_album['publish_date'], music_album['archived'], music_album['on_spotify']))
            end
        else
            File.write(file, JSON.generate([]))
        end
        data
    end

    def load_genres
        file = './data/genres.json'
        data = []
        if File.exist?(file)
            JSON.parse(File.read(file)).each do |genre|
                data.push(Genre.new(genre['name']))
            end
        else
            File.write(file, JSON.generate([]))
        end
        data
    end

    def save_music_albums
        data = []
        @music_albums.each do |music_album|
            data.push({
                id: music_album.id,
                publish_date: music_album.publish_date,
                archived: music_album.archived,
                on_spotify: music_album.on_spotify })
        end
        File.write('./data/music_albums.json', JSON.generate(data))
    end

    def save_genres
        data = []
        @genres.each do |genre|
            data.push({
                id: genre.id,
                name: genre.name })
        end
        File.write('./data/genres.json', JSON.generate(data))
    end

    def to_hash(music_album)
        {
            id: music_album.id,
            publish_date: music_album.publish_date,
            archived: music_album.archived,
            on_spotify: music_album.on_spotify
        }
    end
end





