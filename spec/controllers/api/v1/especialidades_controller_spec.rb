require 'rails_helper'

describe Api::V1::EspecialidadesController do
  render_views

  before do
    FactoryGirl.create_list(:especialidade, 2)
  end

  let(:especialidade1) { Especialidade.first }
  let(:especialidade2) { Especialidade.second }

  context "GET #index" do
    before { get :index }
    subject { JSON.parse(response.body) }
    
    it { expect(response.response_code).to eq 200 }
    it { expect(subject).to be_an_instance_of Array }
    it { expect(subject.size).to eq 2 }

    it { expect(subject.first["id"]).to eq especialidade1.id }
    it { expect(subject.first["nome"]).to eq especialidade1.nome }
    
    it { expect(subject.second["id"]).to eq especialidade2.id }
    it { expect(subject.second["nome"]).to eq especialidade2.nome }
  end

 
  context "GET #show" do
    before { get :show, params: { id: especialidade1.id }}
    subject { JSON.parse(response.body) }
   
    it { expect(response.response_code).to eq 200 }
    it { expect(subject["id"]).to eq especialidade1.id }
     
   end

  context "POST #create" do
    let(:especialidade_json) { FactoryGirl.attributes_for(:especialidade) }
    before { post :create, params: { especialidade: especialidade_json } }
    subject { JSON.parse(response.body) }

    it { expect(response.response_code).to eq 201 }
    it { expect(subject["nome"]).to eq  especialidade_json[:nome]    }
    
  end


  context "PUT #update" do
    before { put :update, params: { id: especialidade1.id, especialidade: { nome: "Ginecologista" } } }
    subject { JSON.parse(response.body) }

    it { expect(response.response_code).to eq 200 }
    it { expect(subject["id"]).to eq especialidade1.id }
    it { expect(subject["nome"]).to eq "Ginecologista" }
    it { expect(especialidade1.reload.nome).to eq "Ginecologista" }
  end

  context "DELETE #destroy" do
    before { delete :destroy, params: { id: especialidade2.id }}

    it { expect(response.response_code).to eq 204 }
    it { expect { Especialidade.find(especialidade2.id) }.to raise_exception(ActiveRecord::RecordNotFound) }
  end
end