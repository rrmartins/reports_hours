defmodule ReportsHours.HoursMonthTest do
  use ExUnit.Case

  alias ReportsHours.HoursMonth

  describe "call/4" do
    setup do
      person = :rodrigo
      months = %{
          rodrigo: %{
            apr: 0,
            aug: 0,
            dec: 0,
            feb: 0,
            jan: 0,
            jul: 0,
            jun: 0,
            mar: 0,
            may: 0,
            nov: 0,
            oct: 0,
            sep: 0
          }
        }
      {:ok, date} = Date.new(2021, 3, 1)
      hour = 12

      {:ok, person: person, date: date, months: months, hour: hour}
    end

    test "return a map with hours", %{person: person, date: date, months: months, hour: hour} do
      response = HoursMonth.call(date, person, months, hour)

      expected_response = %{rodrigo: %{apr: 0, aug: 0, dec: 0, feb: 0, jan: 0, jul: 0, jun: 0, mar: 12, may: 0, nov: 0, oct: 0, sep: 0}}

      assert expected_response == response
    end
  end
end
