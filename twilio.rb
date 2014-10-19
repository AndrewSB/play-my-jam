require 'twilio-ruby'
require 'sinatra'
require 'pp'
require './main'

post '/message'  do
	pp params
	text = search_by_lyrics(params["Body"])
	content_type "text/xml"
	"<Response>
		<Message>
			#{text}
		</Message>
	</Response>"

end