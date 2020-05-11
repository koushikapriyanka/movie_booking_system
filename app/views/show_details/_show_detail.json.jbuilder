json.extract! show_detail, :id, :theatre_id, :movie_id, :timing, :ticket_fee, :date, :created_at, :updated_at
json.url show_detail_url(show_detail, format: :json)
