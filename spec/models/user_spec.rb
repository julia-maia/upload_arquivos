require "rails_helper"

RSpec.describe User, :type => :model do
  let(:user) {FactoryBot.create(:user)} 
  it "é um usuário válido" do
    expect(user).to be_valid
  end

  it "usuário não é válido" do
    user.update(email_address: nil)    
    expect(user).not_to be_valid
  end
end
