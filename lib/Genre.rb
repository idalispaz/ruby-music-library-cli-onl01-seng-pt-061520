class Genre
    attr_accessor :name
    attr_reader :songs
    extend Concerns::Findable
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
    end 

    def Genre.all 
        @@all 
    end 

    def save
        @@all << self
    end 

    def Genre.destroy_all 
        @@all.clear 
    end 

    def Genre.create(name)
        genre_new = self.new(name)
        genre_new.save
        genre_new
    end 
    
    def artists
        self.songs.collect {|song| song.artist}.uniq
    end 
end 