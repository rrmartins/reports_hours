defmodule ReportsHoursTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      response =
        "gen_test"
        |> ReportsHours.build()

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
          natali: 44,
          rafael: 0,
          rodrigo: 44,
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
            mar: 44,
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
            mar: 44,
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
          natali: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 44},
          rafael: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
          rodrigo: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 44, "2020" => 0},
          vinicius: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0}
        }
      }

      assert expected_response == response
    end
  end

  describe "build_many_csv/1" do
    test "builds the report" do
      response =
        ["gen_test", "gen_test"]
        |> ReportsHours.build_many_csv()

      expected_response =
        {:ok,
         %{
           "all_hours" => %{
             cleiton: 0,
             daniele: 0,
             danilo: 0,
             diego: 0,
             giuliano: 0,
             jakeliny: 0,
             joseph: 0,
             mayk: 0,
             natali: 88,
             rafael: 0,
             rodrigo: 88,
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
               mar: 88,
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
               mar: 88,
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
             natali: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 88},
             rafael: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0},
             rodrigo: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 88, "2020" => 0},
             vinicius: %{"2016" => 0, "2017" => 0, "2018" => 0, "2019" => 0, "2020" => 0}
           }
         }}

      assert expected_response == response
    end
  end
end
