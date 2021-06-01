class Task < ApplicationRecord
    belongs_to :category
    validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 100}
    validates :description, length: {maximum: 2000}
    validate :due_date_cannot_be_in_the_past

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
end
