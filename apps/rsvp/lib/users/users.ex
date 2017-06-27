defmodule Rsvp.Users do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :events, Rsvp.Events

    timestamps
  end

  @required_fields ~w(username email password)a
  @optional_fields ~w(first_name last_name)a

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6)
  end

end
