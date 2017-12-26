require 'rails_helper'

describe Api::V1::ConveniosController do
  render_views

  before do
    FactoryGirl.create_list(:convenio, 2)
  end

  let(:convenio1) { Convenio.first }
  let(:convenio2) { Convenio.second }

  context "GET #index" do
    before { get :index }
    subject { JSON.parse(response.body) }
    
    it { expect(response.response_code).to eq 200 }
    it { expect(subject).to be_an_instance_of Array }
    it { expect(subject.size).to eq 2 }

    it { expect(subject.first["id"]).to eq convenio1.id }
    it { expect(subject.first["nome"]).to eq convenio1.nome }
    
    it { expect(subject.second["id"]).to eq convenio2.id }
    it { expect(subject.second["nome"]).to eq convenio2.nome }
  end

 
  context "GET #show" do
    before { get :show, params: { id: convenio1.id }}
    subject { JSON.parse(response.body) }
   
    it { expect(response.response_code).to eq 200 }
    it { expect(subject["id"]).to eq convenio1.id }
     
   end

  context "POST #create" do
    let(:convenio_json) { FactoryGirl.attributes_for(:convenio) }
    before { post :create, params: { convenio: convenio_json } }
    subject { JSON.parse(response.body) }

    it { expect(response.response_code).to eq 201 }
    it { expect(subject["nome"]).to eq  convenio_json[:nome]    }
    
  end


  context "PUT #update" do
    before { put :update, params: { id: convenio1.id, convenio: { nome: "Transmontano" } } }
    subject { JSON.parse(response.body) }

    it { expect(response.response_code).to eq 200 }
    it { expect(subject["id"]).to eq convenio1.id }
    it { expect(subject["nome"]).to eq "Transmontano" }
    it { expect(convenio1.reload.nome).to eq "Transmontano" }
  end

  context "DELETE #destroy" do
    before { delete :destroy, params: { id: convenio2.id }}

    it { expect(response.response_code).to eq 204 }
    it { expect { Convenio.find(convenio2.id) }.to raise_exception(ActiveRecord::RecordNotFound) }
  end
end