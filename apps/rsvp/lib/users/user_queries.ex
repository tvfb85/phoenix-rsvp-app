defmodule Rsvp.UserQueries do
  import Ecto.Query

  alias Rsvp.{Repo, Users}

  def create(user) do
    Repo.insert(user)
  end

end
