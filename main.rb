require 'rapgenius'
require 'sinatra'
require 'pp'
require 'json'

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