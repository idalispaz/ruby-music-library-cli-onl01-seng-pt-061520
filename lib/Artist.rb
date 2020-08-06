class Artist
    attr_accessor :name
    attr_reader :songs
    extend Concerns::Findable 
    @@all = []
    
    def initialize(name)
        @name = name 
        @songs = []
    end 

    def Artist.all 
        @@all 
    end 

    def Artist.destroy_all
        @@all.clear 
    end 

    def Artist.create(name)
        artist_new = self.new(name)
        artist_new.save
        artist_new
    end 

    def save 
        @@all << self 
    end 

    def add_song(song)
        if song.artist == nil && self.songs.include?(song) == false 
            @songs << song
        song.artist = self 
        elsif self.songs.include?(song) == false
            @songs << song
        end 
    end 

    def genres
        self.songs.collect {|song| song.genre}.uniq
    end 
end    
