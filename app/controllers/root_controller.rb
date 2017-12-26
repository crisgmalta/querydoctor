class RootController < ApplicationController

  def index
  	render json: {
  	  convenios: convenios_url,
  	  especialidades: especialidades_url,
  	  medicos: medicos_url,
  	  pacientes: pacientes_url
  	}
  end
end