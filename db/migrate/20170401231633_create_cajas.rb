class CreateCajas < ActiveRecord::Migration[5.0]
  def change
    create_table :cajas do |t|
      t.integer :id_venta
      t.integer :cantidad
      t.string :nombre
      t.decimal :precio
      t.decimal :importe

      t.timestamps
    end
  end
end
