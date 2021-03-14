defmodule ReportsHours.HoursMonth do
  def call(date, person, months, hour) do
    month =
      Calendar.strftime(date, "%b")
      |> String.downcase()
      |> String.to_atom()

    mon = Map.put(months[person], month, months[person][month] + hour)
    Map.put(months, person, mon)
  end
end
