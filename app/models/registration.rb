class Registration < ApplicationRecord
  before_save :set_price
  before_save :set_total_price, :set_status

  belongs_to :user
  belongs_to :event

  validates :guests_count, presence: true


  def self.count_by_status
    group(:status).count
  end

  def self.earliest_reg
    order(created_at: :desc).first
  end

  def self.order_by_created
    order(:created_at)
  end

  def set_status
    event.price > 0 ? self.status = "pending" : self.status = "confirmed"
  end

  def set_price
    price = self.event.price
  end

  def set_total_price
    self.price = event.price * guests_count
  end
end
