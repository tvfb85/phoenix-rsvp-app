defmodule RsvpWeb.ChatController do
  use RsvpWeb.Web, :controller

  def index(conn, _) do
    render conn, "chat.html"
  end

  def new(conn, %{"message_form" => %{"text" => text}}) do
    RsvpWeb.ChatChannel.send_message(text)
    redirect conn, to: "/chat"
  end

end
