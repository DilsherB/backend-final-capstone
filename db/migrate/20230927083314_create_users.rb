class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :role
      t.string :driver_license
      t.string :id_number

      t.timestamps
    end
  end
end
