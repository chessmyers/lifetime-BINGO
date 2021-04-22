import consumer from "./consumer"

consumer.subscriptions.create("BingoHallChannel", {
  initialized() {
    this.update = this.update.bind(this)
  }
})
  connected() {
    this.install()
    this.update()
  },

disconnected() {
  this.uninstall()
},

mark_square() {

},

unmark_square
{
},
});
// app/javascript/channels/chat_channel.js

