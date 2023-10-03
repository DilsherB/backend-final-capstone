class AddCarName < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :name, :string
  end
end
