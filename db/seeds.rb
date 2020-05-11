# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |index|
	Movie.create(name: "Movie_#{index}")
end

timings = ['9:00', '11:00', '14:30', '17:30']
movie_ids = Movie.all.pluck(:id)

10.times do |index| 
	t = Theatre.create(name: "Theatre_#{index}", seat_limit: [50, 75, 100].sample)
	4.times do |index_2|
		ShowDetail.create!(movie_id: movie_ids[index], theatre_id: t.id, timing: timings[index_2], ticket_fee: 150, date: Date.today + index)
	end
end	
