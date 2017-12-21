class Api::V1::ConveniosController < ApplicationController
  before_action :set_convenio, only: [:show, :update, :destroy]

  # GET /api/v1/convenios
  def index
    @convenios = Convenio.all

    render json: @convenios
  end

  # GET /api/v1/convenios/1
  def show
    render json: @convenio
  end

  # POST /api/v1/convenios
  def create
    @convenio = Convenio.new(convenio_params)

    if @convenio.save
      render json: @convenio, status: :created, location: @convenio
    else
      render json: @convenio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/convenios/1
  def update
    if @convenio.update(convenio_params)
      render json: @convenio
    else
      render json: @convenio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/convenios/1
  def destroy
    @convenio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convenio
      @convenio = Convenio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def convenio_params
      params.fetch(:convenio, {})
    end
end
