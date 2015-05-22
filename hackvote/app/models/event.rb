class Event < ActiveRecord::Base
  has_many :projects
  # order so we can display past hackdays
  default_scope -> { order(created_at: :desc) }
  # make sure we have title for event, and title doesn't overflow string.
  validates :title, presence: true, length: { maximum: 255 }

  def project_feed
  	Project.where("event_id = ?", id)
  end
  
end
