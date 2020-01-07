require('spec_helper')
require('project')
require('artist')
require('song')

describe '#Artist' do

  describe("#save") do
    it('saves an artist')do
      artist = Artist.new(:name =>"Beyonce", :id => 2)
      artist.save()
      artist2 = Artist.new(:name =>"Alannis", :id => 1)
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe ('.all') do
    it("is empty")do
    expect(Artist.all()).to(eq([]))
  end
end

describe('.clear') do
    it("clears all artists") do
      artist = Artist.new(:name =>"Beyonce", :id => 2)
      artist.save()
      artist2 = Artist.new(:name =>"Alannis", :id => 1)
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#update_name') do
    it("updates an artists's name by id") do
      artist = Artist.new(:name =>"Beyonce", :id => 2)
      artist.save()
      artist.update_name("Madonna")
      expect(artist.name).to(eq("Madonna"))
    end
  end

  describe('#delete') do
      it("deletes an artist by id") do
        artist = Artist.new(:name =>"Beyonce", :id => 2)
        artist.save()
        artist2 = Artist.new(:name =>"Alannis", :id => 1)
        artist2.save()
        artist.delete()
        expect(Artist.all).to(eq([artist2]))
      end
    end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new(:name =>"Blue", :id => 1)
      album2 = Album.new(name: "Blue", id: 1)##this is an alternate way to enter key-value pair
      expect(album).to(eq(album2))
    end
  end

  describe('.find') do
      it("finds an album by id") do
        album = Album.new(:name =>"Giant Steps", :id => 2)
        album.save()
        album2 = Album.new(:name =>"Blue", :id => 1)
        album2.save()
        expect(Album.find(album.id)).to(eq(album))
      end
    end

  describe('.search') do
    it("finds the album by name") do
      album = Album.new(:name =>"Blue", :id => 1)
      album.save()
      searchedAlbum = Album.search(:name)
      foundAlbum = Album.new(:name => searchedAlbum.fetch('name'), :id => searchedAlbum.fetch('id'))
      expect(foundAlbum).to(eq(album))
    end
  end

  describe('#songs') do
      it("returns an album's songs") do
        album = Album.new(:name =>"Giant Steps", :id => nil)
        album.save()
        song = Song.new(:name =>"Naima", :id => 2, :album_id => 1, :artist_id => 2)
        song.save()
        song2 = Song.new(:name =>"SingSong Song", :id => 3, :album_id => 1, :artist_id => 2)
        song2.save()
        expect(album.songs).to(eq([song, song2]))
      end
    end
end
