defmodule FoodFinder.Uploader.CSVUploader do
  def csv_to_list(path) do
    path
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(&elem(&1, 1))
  end
end
