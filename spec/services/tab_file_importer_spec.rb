require 'rails_helper'

RSpec.describe TabFileImporter do
  let(:user) { create(:user) }
  let(:file_path) { Rails.root.join('spec/fixtures/files/teste.txt') }
  let(:file) { Rack::Test::UploadedFile.new(file_path, 'text/plain') }

  it "retorna o total esperado de importação" do
    total = described_class.call(file, user.id)

    expect(total).to eq(160.0)
  end
end