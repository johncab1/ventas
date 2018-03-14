class CajasController < ApplicationController
  before_action :set_venta, only: [:sale, :show]

  def index
     @venta = Sale.all
  end



  def cobrar
    contador_disminuir_cantidades = -1
    contador_registro_ventas = -1
  	@total = params[:cajas]["cantidad_total"]
  	@productos = params[:cajas]["productos"].split(",")
  	@cantidades = params[:cajas]["cantidades"].split(",")
  	@insertar_total = Sale.new(params[:cajas].permit(:monto))
    @insertar_total.save

    #Disminuyendo las cantidades del inventario
    @productos.each do |producto|
      contador_disminuir_cantidades = contador_disminuir_cantidades + 1
      get_cantidad = Entrada.find_by_nombre(producto)
      catidad_vendida = @cantidades[contador_disminuir_cantidades]
      total = get_cantidad.cantidad.to_i - catidad_vendida.to_i
      Entrada.find_by_nombre(producto).update_attribute(:cantidad, total)
    end


    #registrar los productos vendidos
    @ultima_venta = Sale.last
    @productos.each do |producto|
      contador_registro_ventas = contador_registro_ventas + 1
      Sold.create(:nombre => producto, :cantidad => @cantidades[contador_registro_ventas].to_i, :sale_id=> @ultima_venta.id)
    end
  	 
    redirect_to cajas_path, :flash => { :success => "Se registro la venta correctamente" }
  	
  end

  def ventas
    @ventas = Sale.all
  end

  # GET /entradas/1
  # GET /entradas/1.json

  def show
  end

  def set_venta
      @venta = Sale.find(params[:id])
  end
end
