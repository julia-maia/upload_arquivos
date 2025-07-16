require 'rails_helper'

RSpec.describe PurchasersController, type: :controller do
  let(:user) { create(:user) }

  before do
    session_record = user.sessions.create!(
      user_agent: "RSpec",
      ip_address: "127.0.0.1"
    )
    cookies.signed[:session_id] = session_record.id
  end

  describe "POST #create" do
    context "com parâmetros válidos" do
      let(:valid_params) { { purchaser: attributes_for(:purchaser) } }

      it "cria um novo purchaser e redireciona" do
        expect {
          post :create, params: valid_params
        }.to change(Purchaser, :count).by(1)

        expect(response).to redirect_to(Purchaser.last)
      end
    end

    context "com parâmetros inválidos" do
      let(:invalid_params) { { purchaser: { nome: nil } } }

      it "não cria e renderiza a tela novamente" do
        expect {
          post :create, params: invalid_params
        }.not_to change(Purchaser, :count)

        expect(response).to render_template(:new)
      end
    end
  end
end