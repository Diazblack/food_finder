defmodule FoodFinderWeb.TruckView do
  use FoodFinderWeb, :view
  alias FoodFinderWeb.TruckView

  def render("index.json", %{trucks: trucks}) do
    %{data: render_many(trucks, TruckView, "truck.json")}
  end

  def render("show.json", %{truck: truck}) do
    %{data: render_one(truck, TruckView, "truck.json")}
  end

  def render("truck.json", %{truck: truck}) do
    %{
      id: truck.id,
      address: truck.address,
      applicant: truck.applicant,
      approved_date: truck.approved_date,
      expiration_date: truck.expiration_date,
      application_received_date: truck.application_received_date,
      facility_type: truck.facility_type,
      fire_districts: truck.fire_districts,
      food_items: truck.food_items,
      latitude: truck.latitude,
      location_description: truck.location_description,
      longitude: truck.longitude,
      longitude: truck.longitude,
      neighborhoods: truck.neighborhoods,
      police_districts: truck.police_districts,
      prior_permit: truck.prior_permit,
      schedule: truck.schedule,
      state_plain_x: truck.state_plain_x,
      state_plain_y: truck.state_plain_y,
      supervisor_districts: truck.supervisor_districts,
      zip_codes: truck.zip_codes,
      block: truck.block,
      block_lot: truck.block_lot,
      cnn_segment: truck.cnn_segment,
      days_hours: truck.days_hours,
      resource_location_id: truck.resource_location_id,
      lot: truck.lot,
      permit: truck.permit
    }
  end
end
