defmodule ReportsHours.Head do
  alias ReportsHours.Build

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
  def call do
    all_hours = Enum.into(@available_person, %{}, &{&1, 0})
    months = Enum.into(@months, %{}, &{&1, 0})
    hours_per_month = Enum.into(@available_person, %{}, &{&1, months})
    years = Enum.into(@years, %{}, &{&1, 0})
    hours_per_year = Enum.into(@available_person, %{}, &{&1, years})

    Build.call(all_hours, hours_per_month, hours_per_year)
  end
end
