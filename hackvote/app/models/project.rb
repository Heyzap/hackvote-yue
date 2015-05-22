class Project < ActiveRecord::Base
  belongs_to :event
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 255 }
  validates :creators, presence: true, length: { maximum: 255 }
  validates :event_id, presence: true
end
