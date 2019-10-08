class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :memo, presence: true, length: { maximum: 255 }
  validates :end_time, presence: true
  validates :status, presence: true
end
