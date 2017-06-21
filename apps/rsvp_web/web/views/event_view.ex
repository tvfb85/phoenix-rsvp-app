defmodule RsvpWeb.EventView do
  use RsvpWeb.Web, :view

  def format_date(date) do
    {{y, m, d}, _} = Ecto.DateTime.to_erl(date)
    "#{d}/#{m}/#{y}"
  end

  def format_time(date) do
    {_, {h, m, _}} = Ecto.DateTime.to_erl(date)
    "#{h}:#{m}"
  end
end
