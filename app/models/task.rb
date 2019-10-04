class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :memo, presence: true, length: { maximum: 255 }
end
