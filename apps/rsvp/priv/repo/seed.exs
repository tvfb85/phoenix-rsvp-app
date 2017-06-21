unless(Rsvp.EventQueries.any) do
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2017-11-22 00:00:00", title: "Festival", location: "Ireland"}))
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2017-11-23 00:00:00", title: "Exhibition", location: "Dublin"}))
end
