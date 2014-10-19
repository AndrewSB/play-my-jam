require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'

query = "doses and mimosas"

video_id = YoutubeSearch.search(query)[0]["video_id"]

account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20' 
	auth_token = '835f421ebd9035525705eb827d2a9935'  
	 
	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.calls.create({
		:to => '+12483456497', 
		:from => '+19182129899', 
		:url => "http://YouTubeInMP3.com/fetch/?video=http://www.youtube.com/watch?v=" + video_id,
		:method => 'GET',  
		:fallback_method => 'GET',  
		:status_callback_method => 'GET',    
		:record => 'false'
	})