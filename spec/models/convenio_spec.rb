require 'rails_helper'

RSpec.describe Convenio, type: :model do
	context "Validade do nome do convênio" do
		it "Convênio válido" do
			convenio  = Convenio.new
			convenio.nome = 'SulAmerica'

			expect(convenio.valid?).to be_truthy
		end

		it "Convênio inválido" do
			convenio  = Convenio.new
			convenio.nome = nil

			expect(convenio.valid?).to be_falsey
		end


	end

end
