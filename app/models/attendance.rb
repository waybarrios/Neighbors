class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  attr_accessible :attendance, :event_id, :user_id
end
