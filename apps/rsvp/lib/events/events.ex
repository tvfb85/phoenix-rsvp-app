defmodule Rsvp.Events do
  use Ecto.Schema

  import Ecto.Changeset

  schema "events" do
    field :title, :string
    field :location, :string
    field :date, Ecto.DateTime
    field :description, :string

    timestamps
  end

  @required_fields ~w(title location date)a
  @optional_fields ~w(description)a

  def changeset(event, params \\ %{}) do
    event
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
