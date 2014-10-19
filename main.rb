require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'

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
	make_call(stream_url.location)

end

def make_call(url_location)
	# put your own credentials here 
	account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20' 
	auth_token = '835f421ebd9035525705eb827d2a9935'  
	 
	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.calls.create({
		:to => '12483456497', 
		:from => '+19182129899', 
		:url => url_location,
		:method => 'GET',  
		:fallback_method => 'GET',  
		:status_callback_method => 'GET',    
		:record => 'false'
	})
end