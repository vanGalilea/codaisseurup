class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}

  validates :starts_at, :ends_at, presence: true

end
