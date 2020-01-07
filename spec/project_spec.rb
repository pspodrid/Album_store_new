require('spec_helper')
require('project')
require('song')

describe '#Album' do

  describe("#save") do
    it('saves an album in alphabetical order')do
      album = Album.new(:name =>"Giant Steps", :id => 2)
      album.save()
      album2 = Album.new(:name =>"Blue", :id => 1)
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe ('.all') do
    it("is empty")do
    expect(Album.all()).to(eq([]))
  end
end

describe('.clear') do
    it("clears all albums") do
      album = Album.new(:name =>"Giant Steps", :id => 2)
      album.save()
      album2 = Album.new(:name =>"Blue", :id => 1)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('#update_name') do
    it("updates an album's name by id") do
      album = Album.new(:name =>"Giant Steps", :id => nil)
      album.save()
      album.update_name("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  # describe('#delete') do
  #     it("deletes an album by id") do
  #       album = Album.new(:name =>"Giant Steps", :id => nil)
  #       album.save()
  #       album2 = Album.new(:name =>"Blue", :id => nil)
  #       album2.save()
  #       album.delete()
  #       expect(Album.all).to(eq([album2]))
  #     end
  #   end

    describe('#delete_album') do
  it("deletes all songs belonging to a deleted album") do
    album = Album.new({:name => "A Love Supreme", :id => nil})
    album.save()
    artist = Artist.new({:name => "Beyonce", :id => nil})
    song = Song.new({:name => "Naima", :album_id => album.id, :artist_id => artist.id,:id => nil})
    song.save()
    album.delete_album()
    expect(Song.find(song.id)).to(eq(nil))
  end
end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new(:name =>"Blue", :id => nil)
      album2 = Album.new(name: "Blue", id: nil)##this is an alternate way to enter key-value pair
      expect(album).to(eq(album2))
    end
  end

  describe('.find') do
      it("finds an album by id") do
        album = Album.new(:name =>"Giant Steps", :id => nil)
        album.save()
        album2 = Album.new(:name =>"Blue", :id => nil)
        album2.save()
        expect(Album.find(album.id)).to(eq(album))
      end
    end

  describe('.search') do
    it("finds the album by name") do
      album = Album.new(:name =>"Blue", :id => nil)
      album.save()
      searchedAlbum = Album.search(:name)
      foundAlbum = Album.new(:name => searchedAlbum.fetch('name'), :id => searchedAlbum.fetch('id'))
      expect(foundAlbum).to(eq(album))
    end
  end

  describe('#songs') do
      it("returns an album's songs") do
        album = Album.new({:name =>"Giant Steps", :id => nil})
        album.save()
        song = Song.new({:name =>"Naima", :id => nil, :album_id => album.id, :artist_id => nil})
        song.save()
        song2 = Song.new({:name =>"SingSong Song", :id => nil, :album_id => album.id, :artist_id => nil})
        song2.save()
        expect(album.songs).to(eq([song, song2]))
      end
    end
end
