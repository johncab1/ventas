class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.decimal :monto

      t.timestamps
    end
  end
end
