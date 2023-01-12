defmodule FoodFinder.Uploader do
  alias FoodFinder.Data
  alias FoodFinder.Uploader.CSVUploader, as: CSV

  def upload_truck_data(path) do
    path
    |> CSV.csv_to_list()
    |> Data.batch_create_csv_trucks()
  end
end
