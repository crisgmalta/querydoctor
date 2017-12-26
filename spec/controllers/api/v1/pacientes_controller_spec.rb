require 'rails_helper'

describe Api::V1::PacientesController do
  render_views

  before do
    FactoryGirl.create_list(:paciente, 2)
  end

  let(:paciente1) { Paciente.first }
  let(:paciente2) { Paciente.second }

  context "GET #index" do
    before { get :index }
    subject { JSON.parse(response.body) }
    
    it { expect(response.response_code).to eq 200 }
    it { expect(subject).to be_an_instance_of Array }
    it { expect(subject.size).to eq 2 }

    it { expect(subject.first["id"]).to eq paciente1.id }
    it { expect(subject.first["nome"]).to eq paciente1.nome }
    it { expect(subject.first["rg"]).to eq paciente1.rg }
    it { expect(subject.first["telefone"]).to eq paciente1.telefone }
    it { expect(subject.first["convenio_id"]).to eq paciente1.convenio_id }


    it { expect(subject.second["id"]).to eq paciente2.id }
    it { expect(subject.second["nome"]).to eq paciente2.nome }
    it { expect(subject.second["rg"]).to eq paciente2.rg }
    it { expect(subject.second["telefone"]).to eq paciente2.telefone }
    it { expect(subject.second["convenio_id"]).to eq paciente2.convenio_id }
    
  end

  context "GET #show" do
    before { get :show, params: { id: paciente1.id }}
    subject { JSON.parse(response.body) }
   
    it { expect(response.response_code).to eq 200 }
    it { expect(subject["id"]).to eq paciente1.id }
     
   end

    
  context "POST #create" do
    let(:convenio) { FactoryGirl.create(:convenio) }
    let(:paciente_json) { FactoryGirl.attributes_for(:paciente).merge(convenio_id: convenio.id) }
    before { post :create, params: { paciente: paciente_json } }
    subject { JSON.parse(response.body) }

    it { expect(response.response_code).to eq 201 }
    it { expect(subject["nome"]).to eq  paciente_json[:nome] }
    
  end


  context "PUT #update" do
    before { put :update, params: { id: paciente1.id, paciente: { nome: "Gustavo Borges" } } }
    subject { JSON.parse(response.body) }
    it { expect(response.response_code).to eq 200 }
    it { expect(subject["id"]).to eq paciente1.id }
    it { expect(subject["nome"]).to eq "Gustavo Borges" }
    it { expect(paciente1.reload.nome).to eq "Gustavo Borges" }
  

  end

  context "DELETE #destroy" do
    before { delete :destroy, params: { id: paciente2.id }}

    it { expect(response.response_code).to eq 204 }
    it { expect { Paciente.find(paciente2.id) }.to raise_exception(ActiveRecord::RecordNotFound) }
  end

end