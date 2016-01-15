<viewport>
  <div name="messages" class="messages">
    <message each="{ messageStack }" message="{ this }" me="{ parent.me } socket={opts.socket}" ></message>
  </div>
  <style scoped>
    :scope {  display: block;  }
    div.messages {
      margin: 0; padding: 10px;
      position: fixed; top: 0; right: 0; left: 0; height: auto; width: auto; bottom:150px;
      overflow-x: hidden;
      overflow-y: auto;
    }
  </style>
  <script>
    var socket = opts.socket,
        $this = this,
        $messages;

    $this.mounted = false;

    this.on('mount', function() {
      $this.mounted = true;
      $this.messageStack = [];
    });

    this.on('update', function() {

    })

    this.on('updated', function() {
      setTimeout(function(){
        $this.messages.scrollTop = $this.messages.scrollHeight;
      }, 200);
    })

    this.add = function(message, from) {
      var cls = "system";
      if (from) {
        if (from.id === $this.me.id) {
          cls = "me"
        } else {
          cls = "buddy"
        }
      }
      $this.messageStack.push({
        from: from,
        cls: cls,
        content: message
      });

      $this.update();
    }


    socket.onmessage = function(text, id, channel){
      $this.add(id+channel+text)
    }
    socket.addChannel('ch1')
    socket.connect()

  </script>
</viewport>
