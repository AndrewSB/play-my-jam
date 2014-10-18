var express = require('express')
var app = express();
var sys = require('sys');
var twilio = require('twilio')
var client = new twilio.RestClient('AC4714e1e120457d299eac88f29b529f31','e1f4be4a0f6b8d21a316d791b03c6531')

client.sms.messages.create({
	to:'+12244756148',
	from:'+16309488123',
	body:'ahoy ahoy ahoy bromigo'
}, function(error, message) {
	if(!error) {
		console.log('Success SID for message is: ')
		console.log(message.sid)
	} else {
		console.log('error, yo')
	}
})

 app.set('port', (process.env.PORT || 5000))
 app.use(express.static(__dirname + '/public'))

 app.get('/', function(request, response) {
   response.send('Hello World LOLBro!')
 });


app.post('/incoming', function(request, response) {
    var message = request.body.Body;
    var from = request.body.From;
    sys.log('From: ' + from + ', Message: ' + message);
    var twiml = '<?xml version="1.0" encoding="UTF-8" ?>n<Response>n<Sms>Thanks for your text, we\'ll be in touch.</Sms>n</Response>';
       response.send(twiml, {'Content-Type':'text/xml'}, 200);
});

//// app.listen(app.get('port'), function() { //   console.log("Node app is running at localhost:" + app.get('port')) // })
//var rapgeniusClient = require("rapgenius-js");

//var lyricsSearchCb = function(err, lyricsAndExplanations){
    //if(err){
      //console.log("Error: " + err);
    //}else{
      ////Printing lyrics with section names
      //var lyrics = lyricsAndExplanations.lyrics;
      //var explanations = lyricsAndExplanations.explanations;
      //console.log("Found lyrics for song [title=%s, main-artist=%s, featuring-artists=%s, producing-artists=%s]",
        //lyrics.songTitle, lyrics.mainArtist, lyrics.featuringArtists, lyrics.producingArtists);
      //console.log("**** LYRICS *****\n%s", lyrics.getFullLyrics(true));

      ////Now we can embed the explanations within the verses
      //// lyrics.addExplanations(explanations);
      //// var firstVerses = lyrics.sections[0].verses[0];
      //// console.log("\nVerses:\n %s \n\n *** This means ***\n%s", firstVerses.content, firstVerses.explanation);
    //}
//};

//var searchCallback = function(err, songs){
  //if(err){
    //console.log("Error: " + err);
  //}else{
    //if(songs.length > 0){
      ////We have some songs
      //rapgeniusClient.searchLyricsAndExplanations(songs[0].link, "rap", lyricsSearchCb);
    //}
  //}
//};

//rapgeniusClient.searchSong("Rap God", "rap", searchCallback);
