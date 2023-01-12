defmodule FoodFinder.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodFinder.Data` context.
  """

  @doc """
  Generate a truck.
  """
  def truck_fixture(attrs \\ %{}) do
    {:ok, truck} =
      attrs
      |> Enum.into(%{
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
        status: "REQUESTED",
        supervisor_districts: "some supervisor_districts",
        zip_codes: "some zip_codes"
      })
      |> FoodFinder.Data.create_truck()

    truck
  end
end
