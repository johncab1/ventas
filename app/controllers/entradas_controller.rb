class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :edit, :update, :destroy]

  # GET /entradas
  # GET /entradas.json
  def index
    @entradas = Entrada.all
  end

  # GET /entradas/1
  # GET /entradas/1.json
  def show
  end

  # GET /entradas/new
  def new
    @entrada = Entrada.new
  end

  # GET /entradas/1/edit
  def edit
  end

  # POST /entradas
  # POST /entradas.json
  def create
    #obteniendo el campo de nombre
    @nombre = params[:entrada]["nombre"]
    #instanciando el formulario
    @entrada = Entrada.new(entrada_params)
    #consulta por nombre
    @entrada_name = Entrada.find_by(nombre: @nombre)
    @articulo_data = Articulo.find_by(nombre: @nombre)

      if @articulo_data
    
      if @entrada_name
        flash[:error] = "El articulo ya esta registrado en las entradas."
        redirect_to "/entradas/new"
      else
        @entrada.save
        Entrada.last.update_attribute(:unidad, @articulo_data.unidad)
        Entrada.last.update_attribute(:precio, @articulo_data.precio)
        flash[:success] = "La entrada se ha registrado."
        redirect_to "/entradas/new"
        
      end

    else
      flash[:error] = "El articulo no esta dado de alta."
      redirect_to "/entradas/new"

    end
    
  end

  # PATCH/PUT /entradas/1
  # PATCH/PUT /entradas/1.json
  def update
    @cantidad = params[:entrada]["cantidad"]
    nombre = params[:entrada]["nombre"]
    get_cantidad = Entrada.find_by_nombre(nombre)
    #valor nuevo a sumar
    val = get_cantidad.cantidad
    @total = @cantidad.to_i + val.to_i
    @actualizado = Entrada.find(get_cantidad.id).update_attribute(:cantidad, @total)

    if @actualizado
      flash[:success] = "El articulo se ha actualizado."
      redirect_to "/entradas"
    end
  end

  # DELETE /entradas/1
  # DELETE /entradas/1.json
  def destroy
    @entrada.destroy
    respond_to do |format|
      format.html { redirect_to entradas_url, notice: 'La entrada ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrada
      @entrada = Entrada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entrada_params
      params.require(:entrada).permit(:nombre, :unidad, :precio, :cantidad)
    end
end
