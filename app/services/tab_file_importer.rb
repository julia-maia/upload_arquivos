# app/services/tab_file_importer.rb
require "csv"

class TabFileImporter
  def self.call(file, current_user_id)
    new(file, current_user_id).import
  end

  def initialize(file, current_user_id)
    @file = file
    @user = User.find(current_user_id)
  end

  def import
    total = 0

    CSV.foreach(@file.path, col_sep: "\t", headers: true) do |row|
      purchaser = Purchaser.find_or_create_by(name: row["purchaser name"], user_id: @user.id)
      merchant = Merchant.find_or_create_by(name: row["merchant name"], address: row["merchant address"])
      item = Item.find_or_create_by(description: row["item description"], price: row["item price"], merchant: merchant, user_id: @user.id)
      Purchase.create(purchaser: purchaser, item: item, count: row["purchase count"], user_id: @user.id)

      total += row["item price"].to_f * row["purchase count"].to_i
    end

    total
  end
end
