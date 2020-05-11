json.extract! booking, :id, :user_id, :show_detail_id, :total, :created_at, :updated_at
json.url booking_url(booking, format: :json)
