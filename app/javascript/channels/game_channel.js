import consumer from "./consumer"

consumer.subscriptions.create({channel: 'GameChannel', bingo_hall_id: 1}, {
  connected() {
  //Called when the subscription is ready for use on the server
    console.log("we made it...")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  },

  toggleSquare(data) {

    $("#").onClick(function(event) {
    //if color background == white change to red
      // //if color background == red change to white
    //toggle state via applying or removing a background color

  };
  }
});
