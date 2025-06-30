class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :purchases
  has_many :purchasers
  has_many :items

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true
  validates :email_address, uniqueness: { case_sensitive: false, allow_blank: true }
  end
