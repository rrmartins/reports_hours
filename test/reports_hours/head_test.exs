defmodule ReportsHours.HeadTest do
  use ExUnit.Case

  alias ReportsHours.Head

  describe "call/0" do
    test "returns the map with the structure basic" do
      response = Head.call()

      expected_response = %{
        "all_hours" => %{
          cleiton: 0,
          daniele: 0,
          danilo: 0,
          diego: 0,
          giuliano: 0,
          jakeliny: 0,
          joseph: 0,
          mayk: 0,
          natali: 0,
          rafael: 0,
          rodrigo: 0,
          vinicius: 0
        },
        "hours_per_month" => %{
          cleiton: %{
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
          },
          daniele: %{
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
          },
          danilo: %{
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
          },
          diego: %{
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
          },
          giuliano: %{
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
          },
          jakeliny: %{
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
          },
          joseph: %{
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
          },
          mayk: %{
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
          },
          natali: %{
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
          },
          rafael: %{
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
          },
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
          },
          vinicius: %{
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
        },
        "hours_per_year" => %{
          cleiton: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          daniele: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          danilo: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          diego: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          giuliano: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          jakeliny: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          joseph: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          mayk: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          natali: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          rafael: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          rodrigo: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          vinicius: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0}
        }
      }

      assert expected_response == response
    end
  end
end
