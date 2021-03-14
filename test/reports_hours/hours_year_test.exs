defmodule ReportsHours.HoursYearTest do
  use ExUnit.Case

  alias ReportsHours.HoursYear

  describe "call/4" do
    setup do
      person = :rodrigo

      years = %{
        rodrigo: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0, "2021" => 58}
      }

      {:ok, date} = Date.new(2021, 3, 1)
      hour = 12

      {:ok, person: person, date: date, years: years, hour: hour}
    end

    test "return a map with hours", %{person: person, date: date, years: years, hour: hour} do
      response = HoursYear.call(date, person, years, hour)

      expected_response = %{
        rodrigo: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0, "2021" => 70}
      }

      assert expected_response == response
    end
  end
end
