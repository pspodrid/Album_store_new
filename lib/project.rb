class Album
  attr_accessor :name




  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
  end

  def self.all
    returned_albums = DB.exec("SELECT * FROM albums;")
    albums = []
    returned_albums.each() do |album|
      name = album.fetch('name')
      id = album.fetch('id').to_i
      albums.push(Album.new({:name => name, :id => id}))
    end
    albums
  end

  def save
    result = DB.exec("INSERT INTO albums (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM albums *;")
  end

  def update_name(name)
    @name = name
    DB.exec("UPDATE albums SET name = '#{@name}' WHERE id = #{@id};")
  end

  def update_year(year)
    @year = year
  end

  def update_artist(artist)
    @artist = artist
  end

  def self.find(id)
    album = DB.exec('SELECT * FROM albums WHERE id = #{id};').first
    name = album.fetch('name')
    id = album.fetch('id').to_i
    Album.new({:name => name, :id => id})
  end

  def delete
    DB.exec("DELETE FROM albums WHERE id = #{@id};")
    DB.exec("DELETE FROM songs WHERE album_id = #{@id};")
  end

  def self.search(name)
    @@albums.values.select { |album| album.name == name }
  end

  def self.sorter
    @@albums.values.sort_by {|album| album.name}
  end

  def songs
    Song.find_by_album(self.id)
  end

end
