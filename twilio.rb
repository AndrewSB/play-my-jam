require 'twilio-ruby'
require 'sinatra'
require 'pp'
require './main'

account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20'
auth_token = '835f421ebd9035525705eb827d2a9935'

post '/message'  do
	if params["Body"].include? "-num"
		params_body = params["Body"]
		from = params_body.index("-num") + 5
		text = current_production_call(params_body, params_body[(from.to_i)..-1])
	else
		text = current_production_call(params_body, params["From"])
	end
	content_type "text/xml"
	"<Response>
		<Message>
			#{text}
		</Message>
	</Response>"

end