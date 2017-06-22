defmodule RsvpWeb.EventController do
  use RsvpWeb.Web, :controller

  def show(conn, %{"id" => id}) do
    event = Rsvp.EventQueries.get_by_id(id)
    |> IO.inspect()
    render conn, "details.html", event: event
  end

  def list(conn, _params) do
    events = Rsvp.EventQueries.get_all
    render conn, "list.html", events: events
  end

  def create(conn, _params) do
    changeset = Rsvp.Events.changeset(%Rsvp.Events{}, %{})
    render conn, "create.html", changeset: changeset
  end

  def add(conn, %{"events" => events}) do
    events = Map.update!(events, "date", fn d -> d <> ":00" end)
    %{id: id} = Rsvp.Events.changeset(%Rsvp.Events{}, events)
    |> Rsvp.EventQueries.create
    redirect conn, to: event_path(conn, :show, id)
  end
end
