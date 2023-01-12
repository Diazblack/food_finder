defmodule FoodFinder.Data.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @timestamps_opts [type: :utc_datetime_usec]

  @required [
    :address,
    :applicant,
    :facility_type,
    :permit,
    :resource_location_id,
    :status
  ]

  @optional [
    :approved_date,
    :expiration_date,
    :application_received_date,
    :fire_districts,
    :food_items,
    :latitude,
    :longitude,
    :location_description,
    :neighborhoods,
    :police_districts,
    :prior_permit,
    :schedule,
    :state_plain_x,
    :state_plain_y,
    :supervisor_districts,
    :zip_codes,
    :block,
    :block_lot,
    :cnn_segment,
    :days_hours,
    :lot
  ]

  @fields @required ++ @optional

  schema "trucks" do
    field :address, :string
    field :applicant, :string
    field :application_received_date, :string
    field :approved_date, :string
    field :block, :string
    field :block_lot, :string
    field :cnn_segment, :integer
    field :days_hours, :string
    field :expiration_date, :string
    field :facility_type, :string, default: "N/A"
    field :fire_districts, :integer
    field :food_items, :string
    field :latitude, :decimal
    field :location_description, :string
    field :longitude, :decimal
    field :lot, :string
    field :neighborhoods, :integer
    field :permit, :string
    field :police_districts, :integer
    field :prior_permit, :integer
    field :resource_location_id, :integer
    field :schedule, :string
    field :state_plain_x, :decimal
    field :state_plain_y, :decimal
    field :status, :string
    field :supervisor_districts, :string
    field :zip_codes, :string

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end

  def get_fields, do: @fields
end
