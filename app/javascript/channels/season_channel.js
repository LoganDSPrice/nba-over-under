import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const element = $("#season-id"); 
  const seasonId = element.attr('data-season-id')
  console.log("Connected to Season Channel " + seasonId)
  consumer.subscriptions.create({ channel: "SeasonChannel", season_id: seasonId }, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log($("#logan").text())
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel

      $("#pick_" + data.pickId).replaceWith(data.pick)
    }
  });
})
