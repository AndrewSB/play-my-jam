require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'

client = SoundCloud.new(:client_id => "5d2e84914f361b7350f4f7ece1b223fa")
track = client.get('/tracks', :q => "sober")[0]
puts track
url = client.get(track.stream_url, :allow_redirects => true)
puts url.location	

account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20' 
	auth_token = '835f421ebd9035525705eb827d2a9935'  
	 
	# set up a client to talk to the Twilio REST API 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.calls.create({
		:to => '+12483456497', 
		:from => '+19182129899', 
		:url => "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB8QuAIwAA&url=http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DdaOxo6TFvyw&ei=KTtDVLOEHNGxyASQ3YKYCA&usg=AFQjCNF_1fAw2EzpU6BgfV5Aj_Xaj0Mfbw&sig2=NYJABJNWQ8lKKAIn7NuM2A&bvm=bv.77648437,d.aWw",
		:method => 'GET',  
		:fallback_method => 'GET',  
		:status_callback_method => 'GET',    
		:record => 'false'
	})