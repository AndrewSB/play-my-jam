require 'twilio-ruby'
require 'sinatra'
require 'pp'
require './main'

account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20'
auth_token = '835f421ebd9035525705eb827d2a9935'

post '/message'  do
	text = get_url_from_track(params["Body"], params["From"])
	content_type "text/xml"
	"<Response>
		<Message>
			#{text}
		</Message>
	</Response>"

end