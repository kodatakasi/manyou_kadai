class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labellings

  validates :title, presence: true, length: { maximum: 10 }
  
end
