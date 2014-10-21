require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'

def search_by_lyrics(query, number)
	strings = RapGenius.search_by_lyrics(query)[0..2].collect do | song |
		song.title + " - " + song.artist.name
	end
	strings.join("\n")
end

def search_by_title(query, number)
	strings = RapGenius.search_by_title(query)[0..5].collect do | song |
		puts song
	end
end

def rap_genius_from_name(query, number)
	rapgenius_object_id = RapGenius.search_by_lyrics(query)[0]["id"]
	"genius.com/songs/" + id
end

def hilals_lyrics(query, number)
	uri = URI.parse("http://gaasme.ngrok.com")
	http = Net::HTTP.new(uri.host, uri.port)
	request = Net::HTTP::Post.new("/incoming")
	request.body = {'Body' => query}
	response = http.request(request)
	pp response
end

def get_url_from_track(query, number)
	video = YoutubeSearch.search(query)[0]
	puts video
	pp "just printed video ^"
	video_id = video["video_id"]
	puts "video_id" + video_id
	send_message(video["title"], number)
	make_call(video_id, video, number)
	video
end

def send_song_to_friend(query, number, ognumber)
	video = YoutubeSearch.search(query)[0]
	puts video
	pp "just printed video ^"
	video_id = video["video_id"]
	puts "video_id" + video_id
	ognumber_message = "just sent " + video["title"] + " to " + number + " #playmyjam"
	send_message(ognumber_message, ognumber)
	send_message(video["title"], number)
	make_call(video_id, video, number)
	video
end

def current_production_call(query, number)
	get_url_from_track(query, number)
	#hilals_lyrics(query, number)
end

def make_call(video_id, video, number)
	# put your own credentials here 
	account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20'
	auth_token = '835f421ebd9035525705eb827d2a9935'
	
	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.calls.create({
		:to => number, 
		:from => '+19182129899', 
		:url => "http://YouTubeInMP3.com/fetch/?video=http://www.youtube.com/watch?v=" + video_id,
		:method => 'GET',  
		:fallback_method => 'GET',  
		:status_callback_method => 'GET',    
		:record => 'false'
	})
	video
end

def send_message(body, number)
	account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20' 
	auth_token = '835f421ebd9035525705eb827d2a9935'  
	 
	 body.slice! "video"
	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 

	@client.messages.create(
  		from: '+19182129899',
 		to: number,
 	 	body: body
)
end