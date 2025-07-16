require 'rails_helper'

RSpec.describe ImportsController, type: :controller do
  let(:user) { create(:user) }

  before do
    session_record = user.sessions.create!(
      user_agent: "RSpec",
      ip_address: "127.0.0.1"
    )
    cookies.signed[:session_id] = session_record.id
  end

  describe "POST #create" do
    it "chama o serviço TabFileImporter" do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'teste.txt'), 'text/plain')
      expect(TabFileImporter).to receive(:call).with(instance_of(ActionDispatch::Http::UploadedFile), user.id).and_return(160.0)

      post :create, params: { file: file }
    end
  end
end