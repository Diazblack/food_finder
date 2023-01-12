defmodule FoodFinder.Uploader.CSVUploaderTest do
  use FoodFinder.DataCase

  alias FoodFinder.Data.Truck
  alias FoodFinder.Uploader.CSVUploader
  alias FoodFinder.Uploader.CSVUploader, as: Uploader

  @formatted_row %{
    address: "5 THE EMBARCADERO",
    applicant: "Ziaurehman Amini",
    application_received_date: "20151231",
    approved_date: "",
    block: "0234",
    block_lot: "0234017",
    cnn_segment: "30727000",
    days_hours: "",
    expiration_date: "03/15/2016 12:00:00 AM",
    facility_type: "Push Cart",
    fire_districts: "4",
    food_items: "",
    latitude: "37.794331003246846",
    location_description: "MARKET ST: DRUMM ST intersection",
    longitude: "-122.39581105302317",
    lot: "017",
    neighborhoods: "6",
    permit: "15MFF-0159",
    police_districts: "1",
    prior_permit: "0",
    resource_location_id: "735318",
    schedule:
      "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=15MFF-0159&ExportPDF=1&Filename=15MFF-0159_schedule.pdf",
    state_plain_x: "6013916.72",
    state_plain_y: "2117244.027",
    status: "REQUESTED",
    supervisor_districts: "10",
    zip_codes: "28855"
  }

  describe "CSVUploader.csv_to_list/1" do
    test "returns a list of maps of each row using the truck fields as keys" do
      path = "../../../csv/Mobile_Food_Facility_Permit.csv"
      [head | _tail] = list = Uploader.csv_to_list(path)

      assert head |> Map.keys() |> Enum.sort() == Truck.get_fields() |> Enum.sort()
      assert length(list) == 482
    end
  end

  describe "Truck.coerce_csv_fields" do
    setup(context) do
      tuple =
        {:ok,
         %{
           "Address" => "5 THE EMBARCADERO",
           "Applicant" => "Ziaurehman Amini",
           "Approved" => "",
           "ExpirationDate" => "03/15/2016 12:00:00 AM",
           "FacilityType" => "Push Cart",
           "Fire Prevention Districts" => "4",
           "FoodItems" => "",
           "Latitude" => "37.794331003246846",
           "Location" => "(37.794331003246846, -122.39581105302317)",
           "LocationDescription" => "MARKET ST: DRUMM ST intersection",
           "Longitude" => "-122.39581105302317",
           "NOISent" => "",
           "Neighborhoods (old)" => "6",
           "Police Districts" => "1",
           "PriorPermit" => "0",
           "Received" => "20151231",
           "Schedule" =>
             "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=15MFF-0159&ExportPDF=1&Filename=15MFF-0159_schedule.pdf",
           "Status" => "REQUESTED",
           "Supervisor Districts" => "10",
           "X" => "6013916.72",
           "Y" => "2117244.027",
           "Zip Codes" => "28855",
           "block" => "0234",
           "blocklot" => "0234017",
           "cnn" => "30727000",
           "dayshours" => "",
           "locationid" => "735318",
           "lot" => "017",
           "permit" => "15MFF-0159"
         }}

      {:ok, Map.merge(context, %{tuple: tuple})}
    end

    test "should return a new map formatted as the truck fields", %{tuple: t} do
      params = CSVUploader.coerce_csv_fields(t)
      assert Map.keys(params) |> Enum.sort() == Truck.get_fields() |> Enum.sort()

      assert params == @formatted_row
    end
  end
end
