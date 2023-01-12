defmodule FoodFinder.Uploader.CSVUploader do
  alias FoodFinder.Data.Truck

  @truck_fields Truck.get_fields()
  def csv_to_list(path) do
    path
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(&coerce_csv_fields/1)
  end

  def coerce_csv_fields(tuple) do
    tuple
    |> elem(1)
    |> Enum.reduce(%{}, fn {key, value}, acc -> match_fields_with_headers(key, value, acc) end)
  end

  def match_fields_with_headers("Approved", value, acc),
    do: Map.put(acc, :approved_date, value)

  def match_fields_with_headers("blocklot", value, acc), do: Map.put(acc, :block_lot, value)

  def match_fields_with_headers("cnn", value, acc), do: Map.put(acc, :cnn_segment, value)

  def match_fields_with_headers("dayshours", value, acc),
    do: Map.put(acc, :days_hours, value)

  def match_fields_with_headers("Fire Prevention Districts", value, acc),
    do: Map.put(acc, :fire_districts, value)

  def match_fields_with_headers("locationid", value, acc),
    do: Map.put(acc, :resource_location_id, value)

  def match_fields_with_headers("Neighborhoods (old)", value, acc),
    do: Map.put(acc, :neighborhoods, value)

  def match_fields_with_headers("Received", value, acc),
    do: Map.put(acc, :application_received_date, value)

  def match_fields_with_headers("X", value, acc), do: Map.put(acc, :state_plain_x, value)
  def match_fields_with_headers("Y", value, acc), do: Map.put(acc, :state_plain_y, value)

  def match_fields_with_headers(key, value, acc) do
    camelcase_key = key |> Recase.to_snake() |> String.to_atom()

    if camelcase_key in @truck_fields do
      Map.put(acc, camelcase_key, value)
    else
      acc
    end
  end
end
