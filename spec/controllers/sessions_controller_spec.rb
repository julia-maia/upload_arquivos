require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { create(:user) }

  describe "POST #create" do
    context "com parâmetros válidos" do
      let(:valid_params) do
        {
          email_address: "teste@gmail.com", password: "senha123", password_confirmation: "senha123"
        }
      end

      it "usuário se logou" do
        allow(User).to receive(:authenticate_by).and_return(user)
        expect(controller).to receive(:start_new_session_for).with(user)
        post :create, params: valid_params
      end

      it "redireciona" do
        allow(User).to receive(:authenticate_by).and_return(user)
        post :create, params: valid_params
        expect(response).to redirect_to(new_import_path)
      end
    end  
  end
end