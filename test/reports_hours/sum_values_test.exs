defmodule ReportsHours.SumValuesTest do
  use ExUnit.Case

  alias ReportsHours.SumValues

  describe "call/2" do
    setup do
      person = "Rodrigo"

      day = 26
      month = 3
      year = 2021
      hour = 12

      hours = %{
        rodrigo: 2
      }
      months = %{
        rodrigo: %{
          mar: 20,
        }
      }
      years = %{
        rodrigo: %{"2021" => 58}
      }

      report = %{
         "all_hours" => hours,
         "hours_per_month" => months,
         "hours_per_year" => years
       }

      line_file = [person, hour, day, month, year]

      {:ok, line_file: line_file, report: report}
    end

    test "return a map with hours", %{line_file: line_file, report: report} do
      response = SumValues.call(line_file, report)

      expected_response = %{"all_hours" => %{rodrigo: 14}, "hours_per_month" => %{rodrigo: %{mar: 32}}, "hours_per_year" => %{rodrigo: %{"2021" => 70}}}

      assert expected_response == response
    end
  end
end
