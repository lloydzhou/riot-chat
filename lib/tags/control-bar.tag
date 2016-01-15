<control-bar>
  <form id="msg" onsubmit="{ send }">
    <input type="text" name="message" autocomplete="off" class="u-full-width" placeholder="I'm dangerous …">
    <button name="submit" class="button-primary u-pull-right">Send</button>
  </form>

  <style scoped>
    :scope {
      display: block;
      position: fixed;
      bottom: 0;
      top: auto;
      width: auto;
      left: 0;
      right: 0;
    }

    form {
      background: #FFF;
      margin-bottom: 0px;
      padding: 10px;
    }
  </style>

  <script>
    var socket = opts.socket,
        $this = this;

    send (e) {
      //socket.emit('chat-message', {
      //  from: $this.me,
      //  content: this.message.value
      //});
      console.log($this.message.value)
      //socket.sendMessage(JSON.stringify({nick: 'test', text: $this.message.value}), function(){
      socket.sendMessage($this.message.value, function(){
          $this.message.value = ""
      })

      return false;
    }

  </script>
</control-bar>
