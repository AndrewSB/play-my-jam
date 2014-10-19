require 'rapgenius'
require 'sinatra'
require 'pp'
require 'json'
require 'soundcloud'

post '/search_by_lyrics' do
	query = params["query"]
	strings = RapGenius.search_by_lyrics(query)[0..3].collect do | song |
		{"title" => song.title, "artist" => song.artist.name}
		#song.title + " - " + song.artist.name
	end
	strings.to_json
	#strings.join("\n")

end

post '/search_by_title' do
	query = params["query"]
	strings = RapGenius.search_by_title(query)[0..5].collect do | song |
		puts song
	end
end

post '/get_url_from_track' do 
	query = params["query"]
	client = SoundCloud.new(:client_id => "5d2e84914f361b7350f4f7ece1b223fa")
	
end