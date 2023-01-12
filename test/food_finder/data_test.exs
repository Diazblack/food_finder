defmodule FoodFinder.DataTest do
  use FoodFinder.DataCase

  alias FoodFinder.Data

  describe "trucks" do
    alias FoodFinder.Data.Truck

    import FoodFinder.DataFixtures

    @invalid_attrs %{
      address: nil,
      applicant: nil,
      facility_type: nil,
      resource_location_id: nil,
      status: nil
    }

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Data.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Data.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      valid_attrs = %{
        address: "some address",
        applicant: "some applicant",
        application_received_date: "2023-01-07",
        approved_date: "2023-01-07 23:56:00",
        block: "some block",
        block_lot: "some block_lot",
        cnn_segment: 42,
        days_hours: "some days_hours",
        expiration_date: "2023-01-07 23:56:00",
        facility_type: "Truck",
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
        status: "ISSUED",
        supervisor_districts: "some supervisor_districts",
        zip_codes: "some zip_codes"
      }

      assert {:ok, %Truck{} = truck} = Data.create_truck(valid_attrs)
      assert truck.address == "some address"
      assert truck.applicant == "some applicant"

      assert truck.application_received_date == "2023-01-07"
      assert truck.approved_date == "2023-01-07 23:56:00"
      assert truck.block == "some block"
      assert truck.block_lot == "some block_lot"
      assert truck.cnn_segment == 42
      assert truck.days_hours == "some days_hours"
      assert truck.expiration_date == "2023-01-07 23:56:00"
      assert truck.facility_type == "Truck"
      assert truck.fire_districts == 42
      assert truck.food_items == "some food_items"
      assert truck.latitude == Decimal.new("120.5")
      assert truck.location_description == "some location_description"
      assert truck.longitude == Decimal.new("120.5")
      assert truck.lot == "some lot"
      assert truck.neighborhoods == 42
      assert truck.permit == "some permit"
      assert truck.police_districts == 42
      assert truck.prior_permit == 42
      assert truck.resource_location_id == 42
      assert truck.schedule == "some schedule"
      assert truck.state_plain_x == Decimal.new("120.5")
      assert truck.state_plain_y == Decimal.new("120.5")
      assert truck.supervisor_districts == "some supervisor_districts"
      assert truck.zip_codes == "some zip_codes"
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()

      update_attrs = %{
        address: "some updated address",
        applicant: "some updated applicant",
        application_received_date: "2023-01-08",
        approved_date: "2023-01-08 23:56:00",
        block: "some updated block",
        block_lot: "some updated block_lot",
        cnn_segment: 43,
        days_hours: "some updated days_hours",
        expiration_date: "2023-01-08 23:56:00",
        facility_type: "Push Cart",
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
        status: "SUSPEND",
        supervisor_districts: "some updated supervisor_districts",
        zip_codes: "some updated zip_codes"
      }

      assert {:ok, %Truck{} = truck} = Data.update_truck(truck, update_attrs)
      assert truck.address == "some updated address"
      assert truck.applicant == "some updated applicant"
      assert truck.application_received_date == "2023-01-08"
      assert truck.approved_date == "2023-01-08 23:56:00"
      assert truck.block == "some updated block"
      assert truck.block_lot == "some updated block_lot"
      assert truck.cnn_segment == 43
      assert truck.days_hours == "some updated days_hours"
      assert truck.expiration_date == "2023-01-08 23:56:00"
      assert truck.facility_type == "Push Cart"
      assert truck.fire_districts == 43
      assert truck.food_items == "some updated food_items"
      assert truck.latitude == Decimal.new("456.7")
      assert truck.location_description == "some updated location_description"
      assert truck.longitude == Decimal.new("456.7")
      assert truck.lot == "some updated lot"
      assert truck.neighborhoods == 43
      assert truck.permit == "some updated permit"
      assert truck.police_districts == 43
      assert truck.prior_permit == 43
      assert truck.resource_location_id == 43
      assert truck.schedule == "some updated schedule"
      assert truck.state_plain_x == Decimal.new("456.7")
      assert truck.state_plain_y == Decimal.new("456.7")
      assert truck.status == "SUSPEND"
      assert truck.supervisor_districts == "some updated supervisor_districts"
      assert truck.zip_codes == "some updated zip_codes"
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_truck(truck, @invalid_attrs)
      assert truck == Data.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Data.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Data.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Data.change_truck(truck)
    end
  end
end
