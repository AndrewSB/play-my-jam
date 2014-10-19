require 'soundcloud'
require 'pp'
require 'rapgenius'
require 'json'
require 'twilio-ruby'


# put your own credentials here 
account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20' 
auth_token = '835f421ebd9035525705eb827d2a9935'  
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.calls.create({
	:to => '12483456497', 
	:from => '+19182129899', 
	:url => 'http://anything2mp3.com/system/temporary/mp3/%5BNO%20MOUTH%20EMOJI%5D_youtube_36p96NjMb-s.mp3',  
	:method => 'GET',  
	:fallback_method => 'GET',  
	:status_callback_method => 'GET',    
	:record => 'false'
})