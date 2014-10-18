// Require the twilio and HTTP modules
var twilio = require('twilio'),
    http = require('http');

// Create an HTTP server, listening on port 1337, that
// will respond with a TwiML XML document

http.createServer(function (req, res) {
  
  // Create a TwiML response
    var resp = new twilio.TwimlResponse();

    // The TwiML response object will have functions on it that correspond
    // to TwiML "verbs" and "nouns". This example uses the "Say" verb.
    // Passing in a string argument sets the content of the XML tag.
    // Passing in an object literal sets attributes on the XML tag.
    resp.say({voice:'woman'}, 'ahoy hoy! Testing Twilio and node.js');

    //Render the TwiML document using "toString"
    res.writeHead(200, {
        'Content-Type':'text/xml'
    });
    res.end(resp.toString());

}).listen(1337);

console.log('Visit http://localhost:1337/ in your browser to see your TwiML document!');
