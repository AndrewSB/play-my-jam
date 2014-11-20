require 'twilio-ruby'
require 'sinatra'
require 'pp'
require './main'
require './youtube'

account_sid = 'AC39cfed8c7714f14d7d48e462fa809a20'
auth_token = '835f421ebd9035525705eb827d2a9935'

post '/message'  do
	puts "accepted things"
	friend_number = params["From"];
	from = "";
	params_body = params["Body"]

	if params["Body"].include? "-say"
		say_end = params_body.index("-say") + 5
		body = params_body[say_end..-1]
		if params["Body"].include? "-num"
			from = params_body.index("-num") + 5
			til = params_body.index(" ", (from+5))
			song_name_minus_number = params_body[0..(from - 6)]
			friend_number =  params_body[from..-1]
			text = say_message(body, friend_number)
			puts text
		else
			text = say_message(body, params["From"])
		end
		puts text
	elsif params["Body"].include? "-num"
		from = params_body.index("-num") + 5
		til = params_body.index(" ", from)
		song_name_minus_number = params_body[0..(from - 6)]
		friend_number =  params_body[from..-1]
		text = send_song_to_friend(song_name_minus_number, friend_number, params["From"])
		puts text
	else
		text = get_url_from_track(params["Body"], params["From"])
	end
	content_type "text/xml"
	"<Response>
		<Message>
			#{text}
		</Message>
	</Response>"

end
