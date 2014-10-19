require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'

def search_by_lyrics(query)
	strings = RapGenius.search_by_lyrics(query)[0..2].collect do | song |
		song.title + " - " + song.artist.name
	end
	strings.join("\n")
end

def search_by_title(query)
	strings = RapGenius.search_by_title(query)[0..5].collect do | song |
		puts song
	end
end

def get_url_from_track(query)
	client = SoundCloud.new(:client_id => "5d2e84914f361b7350f4f7ece1b223fa")
	tracks = client.get('/tracks', :q => query)

	stream_url = client.get(tracks[0].stream_url, :allow_redirects => true)
	stream_url
end