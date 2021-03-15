defmodule ReportsHours.SumReportsTest do
  use ExUnit.Case

  alias ReportsHours.SumReports

  describe "call/2" do
    setup do
      hours1 = %{ rodrigo: 2 }
      months1 = %{ rodrigo: %{ mar: 20, } }
      years1 = %{ rodrigo: %{"2021" => 58} }

      hours2 = %{ rodrigo: 8 }
      months2 = %{ rodrigo: %{ mar: 80, } }
      years2 = %{ rodrigo: %{"2021" => 78} }

      report1 = %{
         "all_hours" => hours1,
         "hours_per_month" => months1,
         "hours_per_year" => years1
       }

      report2 = %{
        "all_hours" => hours2,
        "hours_per_month" => months2,
        "hours_per_year" => years2
      }

      {:ok, report1: report1, report2: report2}
    end

    test "return a map with hours", %{report1: report1, report2: report2} do
      response = SumReports.call(report1, report2)

      expected_response = %{"all_hours" => %{rodrigo: 10}, "hours_per_month" => %{rodrigo: %{mar: 100}}, "hours_per_year" => %{rodrigo: %{"2021" => 136}}}

      assert expected_response == response
    end
  end
end
