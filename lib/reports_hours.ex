defmodule ReportsHours do
  alias ReportsHours.Parser

  @available_person [
    :rodrigo,
    :natali,
    :rafael,
    :diego,
    :daniele,
    :mayk,
    :jakeliny,
    :giuliano,
    :joseph,
    :cleiton,
    :vinicius,
    :danilo
  ]

  @months [
    :jan,
    :feb,
    :mar,
    :apr,
    :may,
    :jun,
    :jul,
    :aug,
    :sep,
    :oct,
    :nov,
    :dec
  ]

  @years [
    "2016",
    "2017",
    "2018",
    "2019",
    "2020"
  ]

  def build(file_name) do
    file_name
    |> Parser.build()
    |> Enum.reduce(report_head(), fn line, report -> sum_values(line, report) end)
  end

  def build_many_csv(file_names) when not is_list(file_names) do
    {:error, "Please provice a list from files"}
  end

  def build_many_csv(file_names) do
    result = file_names
             |> Task.async_stream(&build/1)
             |> Enum.reduce(report_head(), fn {:ok, result}, report -> sum_reports(report, result) end)

    {:ok, result}
  end

  defp sum_reports(%{
         "all_hours" => hours1,
         "hours_per_month" => months1,
         "hours_per_year" => years1
       }, %{
         "all_hours" => hours2,
         "hours_per_month" => months2,
         "hours_per_year" => years2
       }) do
         hours = merge_maps(hours1, hours2)
         months = merge_maps(months1, months2)
         years = merge_maps(years1, years2)

         build_report(hours, months, years)
            end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp sum_values([person, hour, _day, month, year], %{
         "all_hours" => hours,
         "hours_per_month" => months,
         "hours_per_year" => years
       }) do
    person =
      String.downcase(person)
      |> String.to_atom()

    hours = Map.put(hours, person, hours[person] + hour)

    {:ok, date} = Date.new(year, month, 1)

    month =
      Calendar.strftime(date, "%b")
      |> String.downcase()
      |> String.to_atom()

    mon = Map.put(months[person], month, months[person][month] + hour)
    months = Map.put(months, person, mon)

    yr = Calendar.strftime(date, "%Y")
    year = Map.put(years[person], yr, years[person][yr] + hour)
    years = Map.put(years, person, year)

    build_report(hours, months, years)
  end

  defp report_head do
    all_hours = Enum.into(@available_person, %{}, &{&1, 0})
    months = Enum.into(@months, %{}, &{&1, 0})
    hours_per_month = Enum.into(@available_person, %{}, &{&1, months})
    years = Enum.into(@years, %{}, &{&1, 0})
    hours_per_year = Enum.into(@available_person, %{}, &{&1, years})

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
