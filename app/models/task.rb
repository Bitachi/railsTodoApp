class Task < ApplicationRecord
  validates :status,  presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :deadline, presence: true
end
