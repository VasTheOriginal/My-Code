require_relative './input_functions'

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
# NB: you will need to add tracks to the following and the initialize()
	attr_accessor :id, :title, :artist, :genre, :tracks

# complete the missing code:
	def initialize (id, title, artist, genre, tracks)
		# insert lines here
		@id = id
		@title = title
		@artist = artist
		@genre = genre
		@tracks = tracks
	end
end
	

class Track
	attr_accessor :id, :name, :location

	def initialize (id, name, location)
		@id = id
		@name = name
		@location = location
	end
end


def read_tracks music_file
	tracks = Array.new()
	count = music_file.gets().to_i  
	index = 0
	while index < count
		title = music_file.gets().chomp()
		location = music_file.gets().chomp()
		track = Track.new(index, title, location) 
		tracks << track	
		index += 1
	end 
	tracks
end

def print_tracks album
	index = 0
	while (index < album.tracks.length)
		print_track(album.tracks[index])
		index += 1	
	end
end

def print_track album
	puts 'Track ID: ' + album.id.to_s
	puts('Track title is: ' + album.name)
	puts('Track file location is: ' + album.location)
end

def read_albums music_file
	index = 0
	albums_size = 2
	albums = Array.new()
	while index < albums_size
		album_title = @music_file.gets()
		album_artist = @music_file.gets()
		album_genre = @music_file.gets()
		tracks = read_tracks(music_file)
		album = Album.new(index, album_title, album_artist, album_genre, tracks)
		albums << album
		index += 1
	end
	albums
end

def display_albums album, music_file
	i = 0
	albums = read_albums(music_file)
	while i < albums.length
		puts 'Album ID ' + album[i].id.to_s
		puts 'Title: ' + album[i].title.to_s
		puts 'Artist: ' + album[i].artist.to_s
		puts 'Genre: ' + album[i].genre.to_s
		i += 1
	end
end

def display_albums_by_genre album,music_file
	i = 0
	albums = read_albums(music_file)
	while i < albums.length
		puts 'Genre: ' + album[i].genre.to_s
		i += 1
	end
	puts 'Enter the genre of the album you wish to view: (Pop, Hip-Hop)'
	case gets.chomp
	when 'Pop','pop'
		puts 'Album ID ' + album[0].id.to_s
		puts 'Title: ' + album[0].title.to_s
		puts 'Artist: ' + album[0].artist.to_s
	when 'Hip-Hop','hip-hop','hiphop','hip hop'
		puts 'Album ID ' + album[1].id.to_s
		puts 'Title: ' + album[1].title.to_s
		puts 'Artist: ' + album[1].artist.to_s
	end
end	


def menu 
	
	puts('You are now in the menu, Choose from the following:
	1. Read in Albums
	2. Display Albums
	3. Select an Album to play
	4. Update an existing Album
	5. Exit the Application')
	case gets.to_i
	when 1
		puts "Enter the filename of the music library."
		@file_name = read_string("File name: ")
		@music_file = File.new(@file_name, "r+")
		puts "The File was loaded successfully!"
		read_string("Press ENTER...")
		menu	
	when 2
		puts ("Display Albums: ")
		display_option_2_menu
	when 3
		puts ("Search for an Album: ")
		search_option_3_menu
	when 4
		puts ("Update an Album: ")
		update_option_4_menu
	when 5
		puts 'You have now EXITED the Application!!!'
	end
end	



def display_option_2_menu 
	puts "1 - Display All"
	puts "2 - Display by genre"
	case gets.to_i
	when 1
		album = read_albums(@music_file)
		display_albums(album,@music_file)
		read_string('Press ENTER...')
		menu
	when 2
		album = read_albums(@music_file)
		display_albums_by_genre(album,@music_file)
		read_string('Press ENTER...')
		menu
	else
		puts 'Please select one of the two options! (1,2)'
		display_option_2_menu
	end
end


def search_option_3_menu
	search_integer = read_integer_in_range('Here you can search for a particular Album and its Tracks. Please enter a valid Album ID: (0,1)', 0, 1)
	album = read_albums(@music_file)
	tracks = read_tracks(@music_file)
	i = search_integer
	puts 'Album ID ' + album[i].id.to_s
	puts 'Title: ' + album[i].title.to_s
	puts 'Artist: ' + album[i].artist.to_s
	puts 'Genre: ' + album[i].genre.to_s
	print_tracks(album[i])
	track_to_play = read_integer_in_range('Please Select a Track (ID) to play:  (0,1,2)' , 0, 2)
	index = track_to_play
	puts 'Now Playing Track ' + album[i].tracks[index].name
	puts "----- NOW PLAYING TRACK! ----- ----- NOW PLAYING TRACK! -----"
	read_string('Press ENTER to go back to the Menu')
	menu
end

def update_option_4_menu
	album_update = read_integer_in_range("Please Enter the Album ID of the Album that you wish to Update:  (0,1)" , 0, 1)
	album = read_albums(@music_file)
	i = album_update
	puts 'Album ID ' + album[i].id.to_s
	puts 'Title: ' + album[i].title.to_s
	puts 'Genre: ' + album[i].genre.to_s
	puts 'Would you like to change the Title or Genre?'
	case gets.chomp
	when 'Title','title'
		new_title = read_string('What would you like the new Title to be? : ')
		puts 'New Title is: ' + new_title
		puts 'Existing Genre is: ' + album[i].genre.to_s
		read_string('Please Press ENTER to return to the menu: ')
		menu
	when 'Genre','genre'
		new_genre = read_string('What would you like the new Genre to be? : ')
		puts 'Existing Title is: ' + album[i].title
		puts 'New Genre is: ' + new_genre
		read_string('Please Press ENTER to return to the menu: ')
		menu
	end
end

	
	
def main
	menu
end

main
