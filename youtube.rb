require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'
require './main'
require 'net/http'

def get_url_from_track(query, number)
  video = YoutubeSearch.search(query)[0]
  puts video
  pp "just printed video ^"
  video_id = video["video_id"]
  puts "video_id" + video_id
  send_message(video["title"], number)
  url = "http://54.149.169.73/convert/url=" + video_id
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  pp res.body
  pp "making call"
  make_call(video_id, video, number)
  pp "made call"
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
