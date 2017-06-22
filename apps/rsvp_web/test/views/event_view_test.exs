defmodule RsvpWeb.EventViewTest do
  use RsvpWeb.ConnCase, async: true

  @tag current: true
  test "Should convert a date to a D/M/Y format" do
    date = Ecto.DateTime.from_erl({{2016, 12, 03}, {00, 00, 00}})
    formatted = RsvpWeb.EventView.format_date(date)
    assert formatted == "3/12/2016"
  end
end
