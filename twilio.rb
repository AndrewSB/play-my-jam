require 'twilio-ruby'
require 'sinatra'
require 'pp'
require './main'

account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20'
auth_token = '{{ auth_token }}'

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