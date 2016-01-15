var riot = require('riot')

require('./tags/message.tag')
require('./tags/viewport.tag')
require('./tags/control-bar.tag')

var pushstream = new PushStream({
     host: window.location.hostname,
     port: window.location.port,
     modes: "websocket",
     messagesPublishedAfter: 5,
     messagesControlByArgument: true
});

console.log(pushstream)
riot.mount('viewport', {socket: pushstream})
riot.mount('control-bar', {socket: pushstream})
