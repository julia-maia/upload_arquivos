require "rails_helper"

RSpec.describe Merchant, :type => :model do
  let(:merchant) {FactoryBot.create(:merchant)}
  it "é um comerciante válido" do
    expect(merchant).to be_valid
  end

  it "nome não pode ficar em branco" do
    merchant = build(:merchant, name: nil)
    expect(merchant).not_to be_valid
  end

  it "endereço não pode ficar em branco" do
    merchant = build(:merchant, address: nil)
    expect(merchant).not_to be_valid
  end
end
