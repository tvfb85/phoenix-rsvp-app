defmodule RsvpWeb.AuthorizedPlug do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts) do
    opts
  end

  def call(conn, _) do
    user_name = conn.cookies["user_name"]

    authorize_user(conn, user_name)
  end

  defp authorize_user(conn, nil) do
    conn
    |> redirect(to: "/login")
    |> halt                       # stop running any more plugs
  end

  defp authorize_user(conn, _) do
    conn
  end

end
