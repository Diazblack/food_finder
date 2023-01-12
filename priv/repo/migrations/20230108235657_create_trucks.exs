defmodule FoodFinder.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :address, :string, null: false
      add :applicant, :string, null: false
      add :approved_date, :string
      add :expiration_date, :string
      add :application_received_date, :string
      add :facility_type, :string, null: false
      add :fire_districts, :integer
      add :food_items, :text
      add :latitude, :decimal
      add :location_description, :text
      add :longitude, :decimal
      add :neighborhoods, :integer
      add :police_districts, :integer
      add :prior_permit, :integer
      add :schedule, :text
      add :state_plain_x, :decimal
      add :state_plain_y, :decimal
      add :status, :string, null: false
      add :supervisor_districts, :string
      add :zip_codes, :string
      add :block, :string
      add :block_lot, :string
      add :cnn_segment, :integer
      add :days_hours, :string
      add :resource_location_id, :integer, null: false
      add :lot, :string
      add :permit, :string, null: false

      timestamps(type: :utc_datetime_usec)
    end

    create constraint(:trucks, :facility_type_enum,
             check: "facility_type IN ('Truck', 'Push Cart', 'N/A')"
           )

    create constraint(:trucks, :status_enum,
             check: "status IN ('REQUESTED', 'ISSUED', 'APPROVED', 'SUSPEND', 'EXPIRED')"
           )
  end
end
