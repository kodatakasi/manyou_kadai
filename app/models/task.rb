class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 30 }
  validates :memo, presence: true, length: { maximum: 255 }
  validates :end_time, presence: true
  validates :status, presence: true
end

# def self.search(search)
#   if search
#     Task.where(['task_name LIKE ?', "%#{search}%"])
#   else
#     Task.all
#   end
# end