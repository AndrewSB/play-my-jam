require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'

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
	video = YoutubeSearch.search(query)[0]
	pp video
	video_id = video["video_id"]
	make_call(video_id, video)
	video
end

def make_call(video_id, video)
	# put your own credentials here 
	account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20' 
	auth_token = '835f421ebd9035525705eb827d2a9935'  
	 
	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.calls.create({
		:to => '12483456497', 
		:from => '+19182129899', 
		:url => "http://YouTubeInMP3.com/fetch/?video=http://www.youtube.com/watch?v=" + video_id,
		:method => 'GET',  
		:fallback_method => 'GET',  
		:status_callback_method => 'GET',    
		:record => 'false'
	})
	video
end