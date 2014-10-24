require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'

query = "query"

video = YoutubeSearch.search(query)[0]
puts query
puts video
pp "just printed video ^"
video_id = video["video_id"]
puts "video_id" + video_id
