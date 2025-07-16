require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user) }

  before do
    session_record = user.sessions.create!(
      user_agent: "RSpec",
      ip_address: "127.0.0.1"
    )
    cookies.signed[:session_id] = session_record.id
  end

  describe "GET #index" do
    it "atribui os itens do usuário logado a @items" do
      item1 = create(:item, user: user)
      item2 = create(:item, user: user)

      get :index

      expect(assigns(:items)).to match_array([item1, item2])
    end
  end
end