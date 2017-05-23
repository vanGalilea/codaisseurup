class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}

  validates :starts_at, presence: true
  validates :ends_at, presence: true,

  # def date_valid?
  #   (starts_at + 1.days) >= ends_at
  # end
  #
  # after_initialize :set_defaults, unless: :persisted?
  # # The set_defaults will only work if the object is new
  #
  # def set_defaults
  #   self.attribute  ||= 'some value'
  #   self.bool_field = true if self.bool_field.nil?
  # end
end
