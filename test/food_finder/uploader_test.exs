defmodule FoodFinder.UploaderTest do
  use FoodFinder.DataCase, async: true

  alias FoodFinder.Data.Truck
  alias FoodFinder.Uploader
  alias FoodFinder.Repo

  describe "Uploader.upload_truck_data/1" do
    setup(context) do
      {:ok, Map.put(context, :path, "../../../csv/Mobile_Food_Facility_Permit.csv")}
    end

    test "should pull data from csv and create DB records", %{path: path} do
      {:ok, map} = Uploader.upload_truck_data(path)

      assert length(Map.keys(map)) == 482
      assert Repo.aggregate(Truck, :count) == 482
    end
  end
end
