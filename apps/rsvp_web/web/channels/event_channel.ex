def RsvpWeb.EventChannel do
  use Phoenix.Channel

  def join("event:" <> event_id, _message, socket) when event_id <= 0 do
    {:error, %{reason: "invalid event id"}}
  end

  def join("event:" <> event_id, _message, socket) do
    {:ok, socket}
  end
end
