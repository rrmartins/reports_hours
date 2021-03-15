defmodule ReportsHours do
  alias ReportsHours.{Head, Parser, SumReports, SumValues}

  def build(file_name) do
    file_name
    |> Parser.build()
    |> Enum.reduce(Head.call(), fn line, report -> SumValues.call(line, report) end)
  end

  def build_many_csv(file_names) when not is_list(file_names) do
    {:error, "Please provice a list from files"}
  end

  def build_many_csv(file_names) do
    result =
      file_names
      |> Task.async_stream(&build/1)
      |> Enum.reduce(Head.call(), fn {:ok, result}, report -> SumReports.call(report, result) end)

    {:ok, result}
  end
end
