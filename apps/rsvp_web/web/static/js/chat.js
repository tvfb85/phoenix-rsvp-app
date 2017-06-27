import socket from './socket'


(function() {

  let channel = socket.channel("chat", {});

  let message = $('#message')
  message.focus();
  message.on('keypress', event => {
    if (event.keyCode == 13) {
      console.log('updating chat')
      channel.push('notify_server', {
        payload: message.val()
      })
      message.val("")
    }
  });

  channel.on("update_chat", payload => {
    console.log("Update", payload.message);
    let messageItem = '<h2>' + payload.message + '</h2>';
    $('.chat-box').append(messageItem);
  });

  channel.join()
    .receive("ok", resp => {
      console.log("Joined chat", resp)
    })
    .receive("error", resp => {
      console.log("Cannot Join", resp)
    });
})();
