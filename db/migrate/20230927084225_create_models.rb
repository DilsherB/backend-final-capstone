class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.string :model_name
      t.integer :year
      t.string :manufacturer
      t.string :logo

      t.timestamps
    end
  end
end
