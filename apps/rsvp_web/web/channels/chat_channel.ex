defmodule RsvpWeb.ChatChannel do
  use Phoenix.Channel

  def join("chat", _message, socket) do
    {:ok, socket}
  end

  def send_message(message) do
    payload = %{"message" => message}
    RsvpWeb.Endpoint.broadcast("chat", "update_chat", payload)
  end

  def handle_in("notify_server", payload, socket) do
    broadcast! socket, "update_chat", %{message: payload["payload"]}
    {:noreply, socket}
  end

end
