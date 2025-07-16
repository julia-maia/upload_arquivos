  require "rails_helper"

  RSpec.describe Item, :type => :model do
    it "é válido com atributos válidos" do
      comerciante = Merchant.create(name: "João", address: "são joão")
      usuario = User.create(nome: "Julia", email_address: "musa@gmail.com")
      item = Item.new(price: 10, description: "teste", merchant_id: comerciante.id, user: usuario)
      expect(item).to be_valid
    end  
    
    it "não é válido sem a descrição" do
      item = Item.new(description: "teste")
      expect(item).not_to be_valid
    end
  end