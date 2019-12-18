class Song
  attr_reader :id
  attr_accessor :name, :album_id

  @@songs = {}
  @@total_rows = 0

  def initialize(name, album_id, id)
    @name = name
    @album_id = album_id
    @id = id || @@total_rows += 1
  end

  def ==(song_to_compare)
    self.name() == song_to_compare.name() && (self.album_id() == song_to_compare.album_id())
  end

  def self.all
    @@songs.values
  end

  def save
    @@songs[self.id] = Song.new(self.name, self.album_id, self.id)
  end
end
