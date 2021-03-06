require('spec_helper')
require('project')
require('artist')
require('song')

describe '#Artist' do

  describe("#save") do
    it('saves an artist')do
      artist = Artist.new(:name =>"Beyonce", :id => nil)
      artist.save()
      artist2 = Artist.new(:name =>"Alannis", :id => nil)
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
      artist = Artist.new(:name =>"Beyonce", :id => nil)
      artist.save()
      artist2 = Artist.new(:name =>"Alannis", :id => nil)
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#update_name') do
    it("updates an artists's name by id") do
      artist = Artist.new(:name =>"Beyonce", :id => nil)
      artist.save()
      artist.update_name("Madonna")
      expect(artist.name).to(eq("Madonna"))
    end
  end

  describe('#update') do
  it("adds an album to an artist") do
    artist = Artist.new({:name => "John Coltrane", :id => nil})
    artist.save()
    album = Album.new({:name => "A Love Supreme", :id => nil})
    album.save()
    artist.update({:album_name => "A Love Supreme"})
    expect(artist.albums).to(eq([album]))
  end
end

  describe('#delete') do
      it("deletes an artist by id") do
        artist = Artist.new(:name =>"Beyonce", :id => nil)
        artist.save()
        artist2 = Artist.new(:name =>"Alannis", :id => nil)
        artist2.save()
        artist.delete()
        expect(Artist.all).to(eq([artist2]))
      end
    end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new(:name =>"Beyonce", :id => nil)
      artist2 = Artist.new(name: "Beyonce", id: nil)##this is an alternate way to enter key-value pair
      expect(artist).to(eq(artist2))
    end
  end

  describe('.find') do
      it("finds an artist by id") do
        artist = Artist.new(:name =>"Giant Steps", :id => nil)
        artist.save()
        artist2 = Artist.new(:name =>"Blue", :id => nil)
        artist2.save()
        expect(Artist.find(artist.id)).to(eq(artist))
      end
    end

  describe('.search') do
    it("finds the artist by name") do
      artist = Artist.new(:name =>"Blue", :id => nil)
      artist.save()
      searchedArtist = Artist.search(:name)
      foundArtist = Artist.new(:name => searchedArtist.fetch('name'), :id =>  searchedArtist.fetch('id'))
      expect(foundArtist).to(eq(artist))
    end
  end

  describe('#songs') do
      it("returns an album's songs") do
        album = Album.new(:name =>"Giant Steps", :id => nil)
        album.save()
        song = Song.new(:name =>"Naima", :id => nil, :album_id => album.id, :artist_id => nil)
        song.save()
        song2 = Song.new(:name =>"SingSong Song", :id => nil, :album_id => album.id, :artist_id => nil)
        song2.save()
        expect(album.songs).to(eq([song, song2]))
      end
    end
end
