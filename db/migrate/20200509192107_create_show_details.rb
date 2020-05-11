class CreateShowDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :show_details do |t|
      t.references :theatre, foreign_key: true
      t.references :movie, foreign_key: true
      t.datetime :timing
      t.integer :ticket_fee
      t.date :date

      t.timestamps
    end
  end
end
