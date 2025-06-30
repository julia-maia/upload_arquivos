class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item
  belongs_to :user
  
  validates :count, presence: true

  def self.filtered_by_purchaser(name, user)
    scope = joins(:purchaser).where(purchasers: { user_id: user.id })
    if name.present?
      scope = scope.where("purchasers.name ILIKE ?", "%#{name}%")
    end
    scope
  end
  
end
