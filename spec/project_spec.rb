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
      album = Album.new(:name =>"Giant Steps", :id => 2)
      album.save()
      album.update_name("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
      it("deletes an album by id") do
        album = Album.new(:name =>"Giant Steps", :id => 2)
        album.save()
        album2 = Album.new(:name =>"Blue", :id => 1)
        album2.save()
        album.delete()
        expect(Album.all).to(eq([album2]))
      end
    end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new(:name =>"Blue", :id => 1)
      album2 = Album.new(name: "Blue", id: 1)##this is an alternate way to enter key-value pair
      expect(album).to(eq(album2))
    end
  end
#
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
        song = Song.new(:name =>"Naima", :id => 2, :album_id => 1)
        song.save()
        song2 = Song.new(:name =>"SingSong Song", :id => 3, :album_id => 1)
        song2.save()
        expect(album.songs).to(eq([song, song2]))
      end
    end
end
