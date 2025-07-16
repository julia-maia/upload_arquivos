require "rails_helper"

RSpec.describe Purchaser, :type => :model do
  let(:purchaser) {FactoryBot.create(:purchaser)}
  it "não há campos em branco" do
    expect(purchaser).to be_valid
  end
end
