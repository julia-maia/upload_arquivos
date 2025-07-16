require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }

  describe "POST #create" do
    context "com parâmetros válidos" do
      let(:valid_params) do
        {
          user: attributes_for(:user, password: "senha123", password_confirmation: "senha123")
        }
      end

      before do
        allow(controller).to receive(:after_authentication_url).and_return("/dashboard")
      end

      it "cria um novo usuário" do
        expect {
          post :create, params: valid_params
        }.to change(User, :count).by(1)
      end

      it "redireciona após salvar" do
        post :create, params: valid_params
        expect(response).to redirect_to("/dashboard")
      end
    end
     

    context "com parâmetros inválidos (sem senha)" do
      let(:invalid_params) do
        {
          user:attributes_for(:user, password: "", password_confirmation: "")
        }
      end

      it "não cria um novo usuário" do
        expect {
          post :create, params: invalid_params
      }.not_to change(User, :count)
      end

      it "renderiza o template :new" do
        post :create, params: invalid_params
          expect(response).to render_template(:new)
      end
    end
  end
end

