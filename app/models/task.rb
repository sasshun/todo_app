class Task < ApplicationRecord
  has_many :task_times, dependent: :destroy

  validates :content, presence: true, format: { without: /\A\s*\z/}


end
