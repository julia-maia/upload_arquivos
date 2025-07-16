require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  let(:user) { create(:user) }
  let!(:purchase) { create(:purchase, user: user) }

  before do
    session_record = user.sessions.create!(
      user_agent: "RSpec",
      ip_address: "127.0.0.1"
    )
    cookies.signed[:session_id] = session_record.id
  end

  describe "GET #new" do
    it "inicializa uma nova compra" do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:purchase)).to be_a_new(Purchase)
    end
  end

  describe "GET #edit" do
    it "carrega uma compra para editar" do
      get :edit, params: { id: purchase.id }
      expect(response).to have_http_status(:ok)
      expect(assigns(:purchase)).to eq(purchase)
    end
  end
end