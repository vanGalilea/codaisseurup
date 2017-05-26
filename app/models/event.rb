class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :themes
  has_many :photos
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, :ends_at, presence: false

  def bargain?
    price < 10
  end

  def self.order_by_price
    order(:price)
  end
end
