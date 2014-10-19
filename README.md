play-my-jam
===========

####Made with <3 at Boilermake Fall 2014

Text a song name, listen to it on your phone. It's that simple #playmyjam

###How It Works
The entry point is `twilio.rb`. It's currently hosted at play-my-jam.heroku.com and listens for a text to the number [918-212-9899](tel:+19182129899). It calls functions in `main.rb` and then carries out the whole `search -> mp3 -> twilio call`
