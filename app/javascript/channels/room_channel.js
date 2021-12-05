import consumer from "./consumer"

consumer.subscriptions.create({ channel: "RoomChannel", room_id: room.id }, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const element = document.getElementById('user_id')
    const user_id = Number(element.getAttribute('data-user-id'));

    let html;

    if (user_id === data.message.user_id) {
      html = data.mine
    } else {
      html = data.theirs
    }

    const messageContainer = document.getElementById('messages')
    messageContainer.innerHTML = messageContainer.innerHTML + html
  }
});
