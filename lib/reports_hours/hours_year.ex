defmodule ReportsHours.HoursYear do
  def call(date, person, years, hour) do
    yr = Calendar.strftime(date, "%Y")
    year = Map.put(years[person], yr, years[person][yr] + hour)
    Map.put(years, person, year)
  end
end
