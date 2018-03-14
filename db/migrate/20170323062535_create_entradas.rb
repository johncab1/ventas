class CreateEntradas < ActiveRecord::Migration[5.0]
  def change
    create_table :entradas do |t|
      t.string :nombre
      t.string :unidad
      t.decimal :precio
      t.integer :cantidad

      t.timestamps
    end
  end
end
