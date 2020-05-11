class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :show_detail, foreign_key: true
      t.float :total
      t.string :status

      t.timestamps
    end
  end
end
