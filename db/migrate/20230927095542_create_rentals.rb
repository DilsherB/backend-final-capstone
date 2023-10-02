class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.string :rental_number
      t.date :rental_date
      t.datetime :time_depart
      t.datetime :time_arrive
      t.string :destination
      t.date :date_return
      t.float :payment
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
