require 'twilio-ruby'
require 'sinatra'
require 'pp'
require './main'

post '/message'  do
	pp params
	text = get_url_from_track(params["Body"])
	content_type "text/xml"
	"<Response>
		<Message>
			#{text}
		</Message>
	</Response>"

end