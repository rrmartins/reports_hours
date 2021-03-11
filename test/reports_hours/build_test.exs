defmodule ReportsHours.BuildTest do
  use ExUnit.Case

  alias ReportsHours.Build

  describe "call/3" do
    test "returns the map with the structure basic" do
      response = Build.call(%{}, %{}, %{})

      expected_response = %{"all_hours" => %{}, "hours_per_month" => %{}, "hours_per_year" => %{}}

      assert expected_response == response
    end
  end
end
