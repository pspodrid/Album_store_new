require('spec_helper')
require ('song')
require ('project')


describe '#Song' do
#
  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      song = Song.new(:name => "Naima", :album_id => 2, :id => nil)
      song2 = Song.new(:name => "Naima", :album_id =>2, :id => nil)
      expect(song).to(eq(song2))
    end
  end

  describe('.all') do
    it("returns a list of all songs") do
      song = Song.new(:name =>"Love Supreme", :album_id =>1, :id => nil)
      song.save()
      song2 = Song.new(:name =>"Naima", :album_id =>1, :id =>nil)
      song2.save()
      expect(Song.all).to(eq([song, song2]))
    end
  end

  describe('.clear') do
    it("clears all songs") do
      song = Song.new(:name =>"Giant Steps", :album_id =>1, :id =>nil)
      song.save()
      song2 = Song.new(:name =>"Naima", :album_id =>1, :id =>nil)
      song2.save()
      Song.clear()
      expect(Song.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a song") do
      song = Song.new(:name =>"Naima", :album_id =>1, :id =>nil)
      song.save()
      expect(Song.all).to(eq([song]))
    end
  end

  describe('.find') do
    it("finds a song by id") do
      song = Song.new(:name =>"Giant Steps", :album_id =>1, :id =>nil)
      song.save()
      song2 = Song.new(:name =>"Naima", :album_id =>1, :id =>nil)
      song2.save()
      expect(Song.find(song.id)).to(eq(song))
    end
  end

  describe('#update') do
    it("updates a song by id") do
      song = Song.new(:name => "Naima", :album_id => 1, :id => nil)
      song.save()
      song.update(:name => "Mr. P.C.", :album_id => 2)
      expect(song.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes all songs belonging to a deleted album") do
      album = Album.new({:name => "A Love Supreme", :id => 1})
      album.save()
      song = Song.new({:name => "Naima", :album_id => 1, :id => 1})
      song.save()
      album.delete()
      expect(Song.find(song.id)).to(eq(nil))
    end
  end

  describe('.find_by_album') do
    it("finds songs for an album") do
      album2 = Album.new(:name =>'Blue', :id => 1)
      album2.save
      song = Song.new(:name =>'Naima', :album_id =>1, :id =>nil)
      song.save()
      song2 = Song.new(:name =>'California', :album_id =>2 , :id =>nil)
      song2.save()
      expect(Song.find_by_album(album2.id)).to(eq([song]))
    end
  end

  describe('#album') do
    it("finds the album a song belongs to") do
      album3 = Album.new(:name => "test", :id => 1)
      album3.save

      song = Song.new(:name =>"Naima", :album_id =>1, :id =>nil)
      song.save

      expect(song.album).to(eq(album3))
    end
  end
end
