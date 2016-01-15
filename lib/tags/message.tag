<message>
  <div class="{ bubble: true, me: cls == 'me', buddy: cls == 'buddy', system: cls == 'system', in: visible }">{ content }</div>
  <style scoped>
    :scope {

    }

    .bubble{
      border-radius: 5px;
      display: inline-block;
      padding: 10px 18px;
      position: relative;
      vertical-align: top;
      color: #999;
      background: #F0F0F0;
      clear: both;
      margin:10px;
      opacity:0.05;
      transition:visibility 0s linear 1s, opacity 430ms ease-in-out;
    }

    .bubble.in {
      transition-delay: 0ms;
      opacity:1;
    }

    .bubble::before {
      content: "\00a0";
      display: block;
      height: 16px;
      position: absolute;
      top: 11px;
      transform:             rotate( 29deg ) skew( -35deg );
      -moz-transform:    rotate( 29deg ) skew( -35deg );
      -ms-transform:     rotate( 29deg ) skew( -35deg );
      -o-transform:      rotate( 29deg ) skew( -35deg );
      -webkit-transform: rotate( 29deg ) skew( -35deg );
      width:  20px;

    }

    .bubble::after {
      content: "\00a0";
      display: block;
      height:1px;
      position: relative;
      width: 100%;
    }

    .bubble.system {
      display: block;
      clear:both;
      width: 90%;
    }

    .buddy {
      background: #AEDB43;
      color: #333;
      float: left;
      margin: 5px 45px 5px 20px;
    }

    .buddy::before {
      background: #AEDB43;
      left: -9px;
    }

    .me {
      color: #555;
      background: #A0E3F8;
      float: right;
      margin: 5px 20px 5px 45px;
    }

    .me::before {
      background: #A0E3F8;
      right: -9px;
    }
  </style>
  <script>
    var socket = opts.socket,
        $this = this;

    this.cls = "";
    this.content = "";
    this.from = {}
    this.visible = false;
    this.me = opts.me;

    console.log("ME", this.me.id);

    this.on('mount', function(){
      this.cls = opts.message.cls;
      this.content = opts.message.content;
      this.from = opts.message.from;
        setTimeout(function() {
          if ($this.from && $this.me && $this.from.id === $this.me.id) {
            var snd = new Audio("sound-send.mp3"); // buffers automatically when created
            snd.play();
          } else if ($this.from && $this.me && $this.from.id !== $this.me.id) {
            var snd = new Audio("sound-receive.mp3"); // buffers automatically when created
            snd.play();
          }
          $this.visible = true;
          $this.update();
        }, 50);

    });
  </script>
</message>
