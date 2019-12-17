class Album
  attr_reader :id, :name

  @@albums = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values.sort_by {|album| album.name}
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end


  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def update(name)
    @name = name
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

end
