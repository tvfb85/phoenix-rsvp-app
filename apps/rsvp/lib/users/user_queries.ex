defmodule Rsvp.UserQueries do
  import Ecto.Query

  alias Rsvp.{Repo, Users}

  def create(user) do
    Repo.insert(user)
  end

  def get_by_username(username) do
    Repo.get(Users, username)
  end
end
