require 'twilio-ruby'
require 'sinatra'
require 'pp'
require './main'

account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20'
auth_token = '835f421ebd9035525705eb827d2a9935'

post '/message'  do
	puts "accepted things"
	if params["Body"].include? "-num"
		params_body = params["Body"]
		from = params_body.index("-num") + 5
		song_name_minus_number = params_body[0..(from - 6)]
		friend_number =  params_body[from..-1]
		text = send_song_to_friend(song_name_minus_number, friend_number, params["From"])
		puts text
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