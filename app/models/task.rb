class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :memo, presence: true, length: { maximum: 255 }
  validates :end_time, presence: true
  validates :status, presence: true
  
  scope :created_at, -> { Task.all.order(created_at: "DESC") }
  scope :end_time, -> { Task.all.order(end_time: "DESC") }
  scope :search_status, -> (status) { Task.where(status: status) }
  scope :search_task_name, -> (task_name){ Task.where("task_name LIKE ?", "%#{ task_name }%") }
end