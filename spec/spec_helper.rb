require("rspec")
require("pg")
require("restaurant")
require("food")

DB = PG.connect({:dbname => "restaurant"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM restaurant *;")
    DB.exec("DELETE FROM food *;")
  end
end
