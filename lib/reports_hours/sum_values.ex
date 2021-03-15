defmodule ReportsHours.SumValues do

  alias ReportsHours.{Build, HoursMonth, HoursPerson, HoursYear}

  def call([person, hour, _day, month, year], %{
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
