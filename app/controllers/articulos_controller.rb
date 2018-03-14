class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show, :edit, :update, :destroy]
  respond_to :html
  # GET /articulos
  # GET /articulos.json
  def index
    @articulos = Articulo.all
  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
    respond_with(@producto)
  end

  # GET /articulos/new
  def new
    @articulo = Articulo.new
  end

  # GET /articulos/1/edit
  def edit
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @nombre_articulo = params[:articulo]["nombre"]
    search_article = Articulo.find_by(nombre: @nombre_articulo)

    if search_article
      then
      flash[:error] = "Ya existe un articulo con este nombre"
      redirect_to "/articulos/new"

    else

    @articulo = Articulo.new(articulo_params)

    
      if @articulo.save
        flash[:success] = "El articulo se ha registrado";
        redirect_to "/articulos/new"
      else
        
      end
    end
    
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    
      if @articulo.update(articulo_params)
        flash[:success] = "El articulo se ha actualizado."
        redirect_to "/articulos"
        
      else
        
      end
    
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html { redirect_to articulos_url, notice: 'El articulo ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:articulo).permit(:nombre, :unidad, :precio)
    end
end
 