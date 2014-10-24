require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'
require './main'

def get_url_from_track(query, number)
  video = YoutubeSearch.search(query)[0]
  puts video
  pp "just printed video ^"
  video_id = video["video_id"]
  puts "video_id" + video_id
  send_message(video["title"], number)
  make_call(video_id, video, number)
  video
end

def send_song_to_friend(query, number, ognumber)
  video = YoutubeSearch.search(query)[0]
  puts query
  puts video
  pp "just printed video ^"
  video_id = video["video_id"]
  puts "video_id" + video_id
  ognumber_message = "just sent " + video["title"] + " to " + number + " #playmyjam"
  send_message(ognumber_message, ognumber)
  send_message(video["title"], number)
  make_call(video_id, video, number)
  video
end
