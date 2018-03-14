class CreateArticulos < ActiveRecord::Migration[5.0]
  def change
    create_table :articulos do |t|
      t.string :nombre
      t.string :unidad
      t.decimal :precio

      t.timestamps
    end
  end
end
