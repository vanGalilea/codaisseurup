class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :bio, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
