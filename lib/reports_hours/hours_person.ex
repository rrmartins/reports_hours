defmodule ReportsHours.HoursPerson do
  def call(person, hours, hour) do
    person =
      String.downcase(person)
      |> String.to_atom()

    %{hours: Map.put(hours, person, hours[person] + hour), person: person}
  end
end
