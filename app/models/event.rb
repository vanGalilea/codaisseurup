class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :themes
  has_many :photos
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, :ends_at, presence: true


  scope :published, -> { where(active: true) }
  scope :order_by_name, -> { order(name: :asc)}
  scope :order_by_price, -> { order(price: :asc)}

  scope :on_date, ->(date) {
    where('? BETWEEN starts_at AND ends_at', date)
  }

  scope :starts_on, ->(start_date) {
    where(starts_at: start_date)
  }

  scope :ends_on, ->(end_date) {
    where('ends_at = ?', end_date)
  }

  def self.all_events_guests
    group(:name).joins(:registrations).sum(:guest_count)
  end

  def guests_per_event
    guests.count
  end

  def bargain?
    price < 10
  end

  def available?
    total_guests = 0

    registrations.each do |registration|
      total_guests += registration.guests_count
    end

    capacity > total_guests
  end
end
