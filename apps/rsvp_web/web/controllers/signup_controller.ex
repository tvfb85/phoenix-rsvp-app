defmodule RsvpWeb.SignupController do
  use RsvpWeb.Web, :controller

  def index(conn, _) do
    render conn, "signup.html"
  end

  def signup(conn, %{"signup" => %{"username" => name}}) do
    expiration = 60
    conn
    |> Plug.Conn.put_resp_cookie("user_name", name, max_age: expiration)
    |> redirect(to: "/")
  end
end
