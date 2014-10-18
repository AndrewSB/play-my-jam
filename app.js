var express = require('express')
    var http = require('http')
    var sys = require('sys');
    var twilio = require('twilio')
var app = express();
var client = new twilio.RestClient('C7c5ccbe028b2bc3f2731f960e6e1a0b9','0a2ac30b128b59d2ed47c0ff55051645')


 app.set('port', (process.env.PORT || 5000))
 app.use(express.static(__dirname + '/public'))

 app.get('/', function(request, response) {
   response.send('Hello World LOLBro!')
 });


app.post('/incoming', function(request, response) {
    var message = request.body.Body;
    var from = request.body.From;
    result = processedMessage
    sys.log('From: ' + from + ', Message: ' + message);

    response.send(processedMessage(message),{'Content-Type':'text/xml'}, 200);
});

http.createServer(app).listen(app.get('port'), function() {    console.log("Node app is running at localhost:" + app.get('port'))  })

function processMessage(message){
    querySongs = require('./getlyrics.js')
    var temp = message
    var oStr = message.slice(0,3)
    var result = "Sorry, couldn't process your request"
    temp = temp(oStr+' ', '')
    if (oStr.localeCompare('(l)')){
        result = 'Name'
        //querySongs.getName(temp)
    }
    else if (oStr.localeCompare('(n)')){
        result = 'Lyrics'
        //querySongs.getLyrics(temp)
    }
    var twiml = '<?xml version="1.0" encoding="UTF-8" ?>n<Response>n<Message>'+result+'</Message>n</Response>';
    return twiml;
}
