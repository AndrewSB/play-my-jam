require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'
require 'sinatra'

get '/' do
    'Nothing here'
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
		:url => "http://54.149.169.73" + video_id,
		:method => 'GET',
		:fallback_method => 'GET',
		:status_callback_method => 'GET',
		:record => 'false'
	})
	video
end

def say_message(body, number)
  # put your own credentials here
  account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20'
  auth_token = '835f421ebd9035525705eb827d2a9935'


  content_type "text/xml"
  "<Response>
  <Say voice=\"alice\">hello there</Say>
  <Dial callerId=\"\">
    <Client>jenny</Client>
  </Dial>
  </Response>"
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
