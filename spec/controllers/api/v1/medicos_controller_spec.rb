require 'rails_helper'

describe Api::V1::MedicosController do
  render_views

  before do
    FactoryGirl.create_list(:medico, 2)
  end

  let(:medico1) { Medico.first }
  let(:medico2) { Medico.second }

  context "GET #index" do
    before { get :index }
    subject { JSON.parse(response.body) }
    
    it { expect(response.response_code).to eq 200 }
    it { expect(subject).to be_an_instance_of Array }
    it { expect(subject.size).to eq 2 }

    it { expect(subject.first["id"]).to eq medico1.id }
    it { expect(subject.first["nome"]).to eq medico1.nome }
    it { expect(subject.first["especialidade_id"]).to eq medico1.especialidade_id }

    
    it { expect(subject.second["id"]).to eq medico2.id }
    it { expect(subject.second["nome"]).to eq medico2.nome }
    it { expect(subject.second["especialidade_id"]).to eq medico2.especialidade_id }
  end

  context "GET #show" do
    before { get :show, params: { id: medico1.id }}
    subject { JSON.parse(response.body) }
   
    it { expect(response.response_code).to eq 200 }
    it { expect(subject["id"]).to eq medico1.id }
     
   end

  context "POST #create" do
    let(:especialidade) { FactoryGirl.create(:especialidade) }
    let(:medico_json) { FactoryGirl.attributes_for(:medico).merge(especialidade_id: especialidade.id) }
    before { post :create, params: { medico: medico_json } }
    subject { JSON.parse(response.body) }

    it { expect(response.response_code).to eq 201 }
    it { expect(subject["nome"]).to eq  medico_json[:nome] }
    
  end

  context "PUT #update" do
    before { put :update, params: { id: medico1.id, medico: { nome: "Dr Bernardo Lima" } } }
    subject { JSON.parse(response.body) }

    it { expect(response.response_code).to eq 200 }
    it { expect(subject["id"]).to eq medico1.id }
    it { expect(subject["nome"]).to eq "Dr Bernardo Lima" }
    it { expect(medico1.reload.nome).to eq "Dr Bernardo Lima" }
  end

  context "DELETE #destroy" do
    before { delete :destroy, params: { id: medico2.id }}

    it { expect(response.response_code).to eq 204 }
    it { expect { Medico.find(medico2.id) }.to raise_exception(ActiveRecord::RecordNotFound) }
  end

end