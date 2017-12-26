class Api::V1::MedicosController < ApplicationController
  before_action :set_medico, only: [:show, :update, :destroy]

  # GET /medicos
  def index
    especialidade_id = params[:especialidade_id]
    @medicos = especialidade_id.nil? ? Medico.all : Medico.where(especialidade_id: especialidade_id)

    render json: @medicos
  end

  # GET /medicos/1
  def show
    render json: @medico
  end

  # POST /medicos
  def create
    @medico = Medico.new(medico_params)

    if @medico.save
      render json: @medico, status: :created, location: @medico
    else
      render json: @medico.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medicos/1
  def update
    if @medico.update(medico_params)
      render json: @medico
    else
      render json: @medico.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medicos/1
  def destroy
    @medico.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico
      @medico = Medico.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medico_params
      params.fetch(:medico).permit(:nome, :especialidade_id)
    end
end
