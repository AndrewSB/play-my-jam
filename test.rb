require 'soundcloud'
require 'pp'

client = SoundCloud.new(:client_id => "5d2e84914f361b7350f4f7ece1b223fa")

tracks = client.get('/tracks', :q => 'time to pretend')
# print each link
stream_url = client.get(tracks[0].stream_url, :allow_redirects => true)
#puts stream_url