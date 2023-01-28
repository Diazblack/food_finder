defmodule(FoodFinderWeb.TruckControllerTest) do
  use FoodFinderWeb.ConnCase

  import FoodFinder.DataFixtures

  alias FoodFinder.Data.Truck

  @create_attrs %{
    address: "some address",
    applicant: "some applicant",
    application_received_date: ~D[2023-01-07],
    approved_date: ~N[2023-01-07 23:56:00],
    block: "some block",
    block_lot: "some block_lot",
    cnn_segment: 42,
    days_hours: "some days_hours",
    expiration_date: ~N[2023-01-07 23:56:00],
    facility_type: "some facility_type",
    fire_districts: 42,
    food_items: "some food_items",
    latitude: "120.5",
    location_description: "some location_description",
    longitude: "120.5",
    lot: "some lot",
    neighborhoods: 42,
    permit: "some permit",
    police_districts: 42,
    prior_permit: 42,
    resource_location_id: 42,
    schedule: "some schedule",
    state_plain_x: "120.5",
    state_plain_y: "120.5",
    supervisor_districts: "some supervisor_districts",
    zip_codes: "some zip_codes"
  }
  @update_attrs %{
    address: "some updated address",
    applicant: "some updated applicant",
    application_received_date: ~D[2023-01-08],
    approved_date: ~N[2023-01-08 23:56:00],
    block: "some updated block",
    block_lot: "some updated block_lot",
    cnn_segment: 43,
    days_hours: "some updated days_hours",
    expiration_date: ~N[2023-01-08 23:56:00],
    facility_type: "some updated facility_type",
    fire_districts: 43,
    food_items: "some updated food_items",
    latitude: "456.7",
    location_description: "some updated location_description",
    longitude: "456.7",
    lot: "some updated lot",
    neighborhoods: 43,
    permit: "some updated permit",
    police_districts: 43,
    prior_permit: 43,
    resource_location_id: 43,
    schedule: "some updated schedule",
    state_plain_x: "456.7",
    state_plain_y: "456.7",
    supervisor_districts: "some updated supervisor_districts",
    zip_codes: "some updated zip_codes"
  }
  @invalid_attrs %{
    address: nil,
    applicant: nil,
    application_received_date: nil,
    approved_date: nil,
    block: nil,
    block_lot: nil,
    cnn_segment: nil,
    days_hours: nil,
    expiration_date: nil,
    facility_type: nil,
    fire_districts: nil,
    food_items: nil,
    latitude: nil,
    location_description: nil,
    longitude: nil,
    lot: nil,
    neighborhoods: nil,
    permit: nil,
    police_districts: nil,
    prior_permit: nil,
    resource_location_id: nil,
    schedule: nil,
    state_plain_x: nil,
    state_plain_y: nil,
    supervisor_districts: nil,
    zip_codes: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe("index") do
    test "lists all trucks", %{conn: conn} do
      conn = get(conn, Routes.truck_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe("create truck") do
    test "renders truck when data is valid", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :create), truck: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.truck_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some address",
               "applicant" => "some applicant",
               "application_received_date" => "2023-01-07",
               "approved_date" => "2023-01-07T23:56:00",
               "block" => "some block",
               "block_lot" => "some block_lot",
               "cnn_segment" => 42,
               "days_hours" => "some days_hours",
               "expiration_date" => "2023-01-07T23:56:00",
               "facility_type" => "some facility_type",
               "fire_districts" => 42,
               "food_items" => "some food_items",
               "latitude" => "120.5",
               "location_description" => "some location_description",
               "longitude" => "120.5",
               "lot" => "some lot",
               "neighborhoods" => 42,
               "permit" => "some permit",
               "police_districts" => 42,
               "prior_permit" => 42,
               "resource_location_id" => 42,
               "schedule" => "some schedule",
               "state_plain_x" => "120.5",
               "state_plain_y" => "120.5",
               "supervisor_districts" => "some supervisor_districts",
               "zip_codes" => "some zip_codes"
             } = json_response(conn, 200)["data"]
    end

    @skip true
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :create), truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  @skip true
  describe "update truck" do
    setup [:create_truck]
    @skip true
    test "renders truck when data is valid", %{conn: conn, truck: %Truck{id: id} = truck} do
      conn = put(conn, Routes.truck_path(conn, :update, truck), truck: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.truck_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "applicant" => "some updated applicant",
               "application_received_date" => "2023-01-08",
               "approved_date" => "2023-01-08T23:56:00",
               "block" => "some updated block",
               "block_lot" => "some updated block_lot",
               "cnn_segment" => 43,
               "days_hours" => "some updated days_hours",
               "expiration_date" => "2023-01-08T23:56:00",
               "facility_type" => "some updated facility_type",
               "fire_districts" => 43,
               "food_items" => "some updated food_items",
               "latitude" => "456.7",
               "location_description" => "some updated location_description",
               "longitude" => "456.7",
               "lot" => "some updated lot",
               "neighborhoods" => 43,
               "permit" => "some updated permit",
               "police_districts" => 43,
               "prior_permit" => 43,
               "resource_location_id" => 43,
               "schedule" => "some updated schedule",
               "state_plain_x" => "456.7",
               "state_plain_y" => "456.7",
               "supervisor_districts" => "some updated supervisor_districts",
               "zip_codes" => "some updated zip_codes"
             } = json_response(conn, 200)["data"]
    end

    @skip true
    test "renders errors when data is invalid", %{conn: conn, truck: truck} do
      conn = put(conn, Routes.truck_path(conn, :update, truck), truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete truck" do
    setup [:create_truck]
    @skip true
    test "deletes chosen truck", %{conn: conn, truck: truck} do
      conn = delete(conn, Routes.truck_path(conn, :delete, truck))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.truck_path(conn, :show, truck))
      end
    end
  end

  defp create_truck(_) do
    truck = truck_fixture()
    %{truck: truck}
  end
end
