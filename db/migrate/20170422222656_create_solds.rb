class CreateSolds < ActiveRecord::Migration[5.0]
  def change
    create_table :solds do |t|
      t.string :nombre
      t.integer :cantidad
      t.integer :sale_id

      t.timestamps
    end
  end
end
