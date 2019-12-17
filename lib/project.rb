class Album
  attr_reader :id, :name, :year, :artist

  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, year, artist)
    @name = name.capitalize
    @id = id || @@total_rows += 1
    @year = year
    @artist = artist
  end

  def self.all
    @@albums.values
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.artist)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end


  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def update_name(name)
    @name = name
  end

  def update_year(year)
    @year = year
  end

  def update_artist(artist)
    @artist = artist
  end

  def self.find(id)
    @@albums[id]
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.search(name)
    @@albums.values.select { |album| album.name == name }
  end

  def self.sorter
    @@albums.values.sort_by {|album| album.name}
  end

end
