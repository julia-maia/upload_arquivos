class AddUserRefToPurchasers < ActiveRecord::Migration[8.0]
  def change
    add_reference :purchasers, :user, foreign_key: true
  end
end
