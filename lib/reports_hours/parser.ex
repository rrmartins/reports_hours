defmodule ReportsHours.Parser do
  def build(file_name) do
    "reports/#{file_name}.csv"
    |> File.stream!()
    |> Stream.map(fn line -> parser_line(line) end)
  end

  defp parser_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, &String.to_integer/1)
    |> List.update_at(4, &String.to_integer/1)
  end
end
