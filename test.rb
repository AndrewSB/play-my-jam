require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'


number = "+17187533087"

body = "Hey Ricky, we're a hack at Boilermake and Greg told us to send you a call with Taylor Swift's Shake it Off"

account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20' 
auth_token = '835f421ebd9035525705eb827d2a9935'  
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 


@client.account.calls.create({
		:to => number, 
		:from => '+19182129899', 
		:url => "http://YouTubeInMP3.com/fetch/?video=http://www.youtube.com/watch?v=nfWlot6h_JM",
		:method => 'GET',  
		:fallback_method => 'GET',  
		:status_callback_method => 'GET',    
		:record => 'false'
	})

@client.messages.create(
  		from: '+19182129899',
 		to: number,
 	 	body: body
)
