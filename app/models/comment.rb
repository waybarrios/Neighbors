class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  attr_accessible :content, :user_id, :event_id

  validates :content, presence: true,
                      length: { minimum: 6 }
end
