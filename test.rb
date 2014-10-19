require 'soundcloud'


client = SoundCloud.new(:client_id => "5d2e84914f361b7350f4f7ece1b223fa")
track = client.get('/tracks', :q => "sober")[0]
url = client.get(track.stream_url, :allow_redirects => true)
puts url
	