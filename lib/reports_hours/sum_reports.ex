defmodule ReportsHours.SumReports do

  alias ReportsHours.Build

  def call(
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
end
