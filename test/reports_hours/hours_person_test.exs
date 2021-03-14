defmodule ReportsHours.HoursPersonTest do
  use ExUnit.Case

  alias ReportsHours.HoursPerson

  describe "call/3" do
    setup do
      person = "Rodrigo"
      hours = %{
        rodrigo: 2
      }
      hour  = 8

      {:ok, person: person, hours: hours, hour: hour}
    end

    test "return a map with hours", %{person: person, hours: hours, hour: hour} do
      response = HoursPerson.call(person, hours, hour)

      expected_response = %{hours: %{rodrigo: 10}, person: :rodrigo}

      assert expected_response == response
    end
  end
end
