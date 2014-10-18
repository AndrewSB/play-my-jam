// var express = require('express')
// var app = express();
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

// app.set('port', (process.env.PORT || 5000))
// app.use(express.static(__dirname + '/public'))

// app.get('/', function(request, response) {
//   response.send('Hello World LOLBro!')
// })

// app.listen(app.get('port'), function() {
//   console.log("Node app is running at localhost:" + app.get('port'))
// })
