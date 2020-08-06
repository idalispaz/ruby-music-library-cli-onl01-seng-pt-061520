class Song

    attr_accessor :name, :artist, :genre
    extend Concerns::Findable
    @@all = []
  
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist= artist if artist != nil
        self.genre= genre if genre != nil
    end

    def save
        @@all << self
    end

    def Song.all
        @@all
    end

    def Song.create(name)
       song = Song.new(name)
       song.save
       song
    end

    def Song.destroy_all
        @@all.clear
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
          @genre = genre
          if genre.songs.include?(self) == false
            genre.songs << self
          end
        end

    def Song.new_from_filename(filename)
        space_filename = filename.split(" - ")
        artist_name = space_filename[0]
        song_name = space_filename[1]
        genre_name = space_filename [2].gsub(".mp3", "")
    
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
    
        new(song_name, artist, genre)
    end

    def Song.create_from_filename(filename)
        new_from_filename(filename).save
    end
    

  

end

