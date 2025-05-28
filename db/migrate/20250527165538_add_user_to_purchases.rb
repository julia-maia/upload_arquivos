class AddUserToPurchases < ActiveRecord::Migration[8.0]
  def change
    add_reference :purchases, :user, foreign_key: true
  end
end
