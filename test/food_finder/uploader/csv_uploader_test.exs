defmodule FoodFinder.Uploader.CSVUploaderTest do
  use FoodFinder.DataCase

  alias FoodFinder.Uploader.CSVUploader, as: Uploader

  @headers [
    "Address",
    "Applicant",
    "Approved",
    "ExpirationDate",
    "FacilityType",
    "Fire Prevention Districts",
    "FoodItems",
    "Latitude",
    "Location",
    "LocationDescription",
    "Longitude",
    "NOISent",
    "Neighborhoods (old)",
    "Police Districts",
    "PriorPermit",
    "Received",
    "Schedule",
    "Status",
    "Supervisor Districts",
    "X",
    "Y",
    "Zip Codes",
    "block",
    "blocklot",
    "cnn",
    "dayshours",
    "locationid",
    "lot",
    "permit"
  ]

  describe "CSVUploader.csv_to_list/1" do
    test "returns a list of maps of each row using the headers as keys" do
      path = "../../../csv/Mobile_Food_Facility_Permit.csv"
      [head | _tail] = list = Uploader.csv_to_list(path)

      assert head |> Map.keys() |> Enum.sort() == @headers
      assert length(list) == 482
    end
  end
end
