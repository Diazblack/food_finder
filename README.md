# FoodFinder
The idea behind FoodFinder is to create a database of Food Trucks using a CSV uploader and expose a JSON API  that allows searching through a database of Food Trunks in San Francisco using the information the city releases.

## Installation 

### Elixir/Phoenix
  * You can follow the [Phoenix](https://hexdocs.pm/phoenix/installation.html) installation guide to install all the required dependencies 

### Postgres & DB Setup

1. You will need PostgreSQL running in you local machine. If you are in an IOS environment homebrew is onw of the easiest ways to install by `brew install postgresql`. [Here] is a wiki link with more information about how to install PostgreSQL

2. Follow the homebrew install advice on how to run the database manually when needed, or for convenience, you can run it automatically on boot by running `brew services start postgresql` once.

3. Create a `postgres` user for the database: `createuser -s postgres` if needed 

4. Create and migrate your database with `mix ecto.setup`

5. Add a new user to your DB with `mix users.add`

6. Add some demo data your db by running:

### To seed the Database 

  * Enter to IEX with `iex -S mix`. 
  * There is a CSV file with some data on the `/.csv` folder, to upload the information to the DB use 
  ```elixir 
    "../../../csv/Mobile_Food_Facility_Permit.csv" 
    |> FoodFinder.Uploader.upload_truck_data()
  ``` 

### To Create a CSV 
  * The the headers that should be present in the CSV are:

  ```elixir
    [
    "Address"
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
  ```
  * The fiedls above will be transform into a `FoodFinder.Data.Truck` struct with the following fields 

  ```elixir
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
  ```

### To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server` 

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Future Enhancements 
  * Add parse functionality for the Date and DateTime fields. 
  * Create a task to seed the database 
  * More complex relational DB Tables to remove duplicated data. For example `applicants`, `locations`, `blocks`.
  * Build an API with full CRUD functionality 
  * Integration with developers API [Socrata](https://datasf.org/opendata/developers/) to keep the records updated 
  * Build an endpoint to search the data using different criteria 
  * Build a UX to display the information 
  * Make a map with the food trucks' location based on search parameters and the latitude and longitude provided. First, we need to verify if this is feasible with the information provided 
  * Notify the applicant when permits have expired 

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
