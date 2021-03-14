defmodule ReportsHours do
  alias ReportsHours.{Build, Head, HoursMonth, HoursPerson, HoursYear, Parser}

  def build(file_name) do
    file_name
    |> Parser.build()
    |> Enum.reduce(Head.call(), fn line, report -> sum_values(line, report) end)
  end

  def build_many_csv(file_names) when not is_list(file_names) do
    {:error, "Please provice a list from files"}
  end

  def build_many_csv(file_names) do
    result =
      file_names
      |> Task.async_stream(&build/1)
      |> Enum.reduce(Head.call(), fn {:ok, result}, report -> sum_reports(report, result) end)

    {:ok, result}
  end

  defp sum_reports(
         %{
           "all_hours" => hours1,
           "hours_per_month" => months1,
           "hours_per_year" => years1
         },
         %{
           "all_hours" => hours2,
           "hours_per_month" => months2,
           "hours_per_year" => years2
         }
       ) do
    hours = merge_maps(hours1, hours2)
    months = merge_maps(months1, months2)
    years = merge_maps(years1, years2)

    Build.call(hours, months, years)
  end

  defp merge_maps(map1, map2) when is_map(map1) do
    Map.merge(map1, map2, fn _key, value1, value2 -> merge_maps(value1, value2) end)
  end

  defp merge_maps(map1, map2), do: map1 + map2

  defp sum_values([person, hour, _day, month, year], %{
         "all_hours" => hours,
         "hours_per_month" => months,
         "hours_per_year" => years
       }) do
    {:ok, date} = Date.new(year, month, 1)

    %{person: person, hours: hours} = HoursPerson.call(person, hours, hour)
    months = HoursMonth.call(date, person, months, hour)
    years = HoursYear.call(date, person, years, hour)

    Build.call(hours, months, years)
  end
end
