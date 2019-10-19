class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :memo, presence: true, length: { maximum: 1000 }
  validates :end_time, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  
  scope :created_at, -> { Task.all.order(created_at: "DESC") }
  scope :end_time, -> { Task.all.order(end_time: "DESC") }
  scope :search_status, -> (status) { Task.where(status: status) }
  scope :search_task_name, -> (task_name){ Task.where("task_name LIKE ?", "%#{ task_name }%") }
  scope :priority, -> { Task.all.order(priority: "DESC") }
  scope :label, -> (label_id){Task.all.joins(:labels).where(labels: { id: params[:label_id] })}
  # scope :label, -> (label_id) { Task.all.where(labels: {label_id: label_id}) }

  enum priority: [:low, :medium, :high]

  belongs_to :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end