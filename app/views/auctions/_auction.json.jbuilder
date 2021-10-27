json.extract! auction, :id, :title, :description, :expiration_date, :starting_price, :price, :status, :created_at, :updated_at
json.url auction_url(auction, format: :json)
