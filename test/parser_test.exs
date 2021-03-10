defmodule ReportsHours.ParserTest do
  use ExUnit.Case

  alias ReportsHours.Parser

  describe "build/1" do
    test "parse the file" do
      response = "gen_test"
                 |> Parser.build
                 |> Enum.map(& &1)

      expected_response = [["Rodrigo", 12, 26, 3, 2019], ["Rodrigo", 8, 27, 3, 2019], ["Rodrigo", 12, 28, 3, 2019], ["Rodrigo", 12, 29, 3, 2019], ["Natali", 12, 26, 3, 2020], ["Natali", 8, 27, 3, 2020], ["Natali", 12, 28, 3, 2020], ["Natali", 12, 29, 3, 2020]]

      assert expected_response == response
    end
  end
end
