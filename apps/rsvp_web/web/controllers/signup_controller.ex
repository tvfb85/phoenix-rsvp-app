defmodule RsvpWeb.SignupController do
  use RsvpWeb.Web, :controller

  def index(conn, %{errors: errors}) do
    render conn, "signup.html", changeset: errors
  end

  def index(conn, _params) do
    changeset = Rsvp.Users.changeset(%Rsvp.Users{}, %{})
    render conn, "signup.html", changeset: changeset
  end

  def signup(conn, %{"users" => users}) do
    IO.puts "these are the user params from the signup form"
    IO.inspect users
    changeset = Rsvp.Users.changeset(%Rsvp.Users{}, users)
    expiration = 60
  conn
    |> Plug.Conn.put_resp_cookie("user_name", users["username"], max_age: expiration)
    |> signup_completion(changeset)
  end

  def signup_completion(conn, changeset) do
    IO.inspect conn
    case Rsvp.UserQueries.create changeset do
      {:ok, %{id: id}} -> redirect conn, to: ("/")
      {:error, reasons} -> index conn, %{errors: reasons}
    end
  end

end
