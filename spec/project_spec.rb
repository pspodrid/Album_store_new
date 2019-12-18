require('rspec')
require('project')

describe '#Album' do

  before(:each)do
  Album.clear()
  end

  describe("#save") do
    it('saves an album in alphabetical order')do
    album = Album.new("Giant Steps", nil, "1989", "Fred") # nil added as second argument
    album.save()
    album2 = Album.new("Blue", nil, "1992", "Bob") # nil added as second argument
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
      album = Album.new("Giant Steps", nil, "1989", "Fred")
      album.save()
      album2 = Album.new("Blue", nil, "1992", "Bob")
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('#update_name') do
    it("updates an album's name by id") do
      album = Album.new("Giant Steps", nil, "1989", "Fred")
      album.save()
      album.update_name("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
      it("deletes an album by id") do
        album = Album.new("Giant Steps", nil, "1989", "Fred")
        album.save()
        album2 = Album.new("Blue", nil, "1992", "Bob")
        album2.save()
        album.delete()
        expect(Album.all).to(eq([album2]))
      end
    end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", nil, "1992", "Bob")
      album2 = Album.new("Blue", nil, "1992", "Bob")
      expect(album).to(eq(album2))
    end
  end

  describe('.find') do
      it("finds an album by id") do
        album = Album.new("Giant Steps", nil, "1989", "Fred")
        album.save()
        album2 = Album.new("Blue", nil, "1992", "Bob")
        album2.save()
        expect(Album.find(album.id)).to(eq(album))
      end
    end

  describe('.search') do
    it("finds the album by name") do
      album = Album.new("Blue", nil, "1992", "Bob")
      album.save()
      expect(Album.search(album.name)).to(eq([album]))
    end
  end


end
