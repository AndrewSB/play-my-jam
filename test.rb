require 'rapgenius'
require 'pp'
require 'json'
require 'soundcloud'
require 'twilio-ruby'
require 'youtube_search'



string = "classic -num 2483456497"
from = string.index("-num") + 5
puts string[from..-1]