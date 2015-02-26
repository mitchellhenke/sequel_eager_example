require 'sequel'
require 'pg'
require 'logger'

DB = Sequel.connect('postgres://localhost/sequel_example', logger: Logger.new(STDOUT))
# DB = Sequel.connect('sqlite://sequel_example.db', logger: Logger.new(STDOUT))

# FIXES IT vvvvv
Sequel::Dataset::NON_SQL_OPTIONS << :eager

DB.create_table? :artists do
  primary_key :id
  String :name
end

DB.create_table? :albums do
  primary_key :id
  String :name
  foreign_key :artist_id, :artists
end

DB.create_table? :songs do
  primary_key :id
  String :name
  foreign_key :album_id, :albums
end

class Artist < Sequel::Model
  one_to_many :albums
  one_to_many :two_albums, clone: :albums, limit: 2
end

class Album < Sequel::Model
  one_to_many :songs
  many_to_one :artist
end

class Song < Sequel::Model
  many_to_one :album
end

Song.dataset.destroy
Album.dataset.destroy
Artist.dataset.destroy

beck = Artist.create(name: 'Beck')
kanye = Artist.create(name: 'Kanye West')

beck_album = Album.create(artist: beck, name: 'The Beck Album 1')
kanye_album = Album.create(artist: kanye, name: 'The College Dropout')

Song.create(album: beck_album, name: 'Beck Song 1')
Song.create(album: beck_album, name: 'Beck Song 2')
Song.create(album: beck_album, name: 'Beck Song 3')
Song.create(album: beck_album, name: 'Beck Song 4')


Song.create(album: kanye_album, name: 'Kanye Song 1')
Song.create(album: kanye_album, name: 'Kanye Song 2')
Song.create(album: kanye_album, name: 'Kanye Song 3')
Song.create(album: kanye_album, name: 'Kanye Song 4')

artists = Artist.eager(two_albums: { proc { |ds| ds.where(Sequel.ilike(:name, 'The%')) } => :songs } ).all

puts "\n** should be no queries below this **\n\n"

artists.map { |a| a.two_albums.map { |ab| ab.songs } }
