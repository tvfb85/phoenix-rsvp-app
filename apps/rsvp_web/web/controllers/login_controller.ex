defmodule RsvpWeb.LoginController do
  use RsvpWeb.Web, :controller

  def index(conn, _) do
    render conn, "login.html"
  end

  def login(conn, %{"login" => %{"username" => name}}) do
    IO.puts "Next is the conn"
    IO.inspect conn.params["login"]["username"]
    expiration = 60
    conn
    |> Plug.Conn.put_resp_cookie("user_name", name, max_age: expiration)
    |> redirect(to: "/")
  end
end
