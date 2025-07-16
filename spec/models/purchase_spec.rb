require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:purchase) { create(:purchase) }

  it "é válido com atributos válidos" do
    expect(purchase).to be_valid
  end

  it "é inválido sem count" do
    purchase.count = nil
    expect(purchase).not_to be_valid
    expect(purchase.errors[:count]).to include("não pode ficar em branco")
  end
end