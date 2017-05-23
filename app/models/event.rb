class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :themes

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, :ends_at, presence: true

end
