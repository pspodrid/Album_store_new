require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('pry')
also_reload('lib/**/*.rb')

get('/test/') do
   @something = "this is a variable"
  erb(:whatever)
end

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  if params[:searchID]
    @albums = [Album.find(params[:searchID].to_i())]
    # binding.pry
  elsif params[:searchName]
    @albums = Album.search(params[:searchName])
  elsif params[:sorter]
    @albums = Album.sorter
  else
    @albums = Album.all
  end
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

post('/albums') do
  name = params[:album_name]
  year = params[:year]
  artist = params[:artist_name]
  album = Album.new(name, nil, year, artist)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  "This will take us to a page with a form for updating an album with an ID of #{params[:id]}."
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  if params[:album_name] != ""
    @album.update_name(params[:album_name])
  end
  if params[:year] != ""
    @album.update_year(params[:year])
  end
  if params[:artist_name] != ""
    @album.update_artist(params[:artist_name])
  end
  @albums = Album.all
  erb(:albums)
end





delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end

get('/albums/:id/edit') do
  "This will take us to a page with a form for updating an album with an ID of #{params[:id]}."
end
