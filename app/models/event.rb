class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood
  attr_accessible :date_event, :description, :place, :time_event, :title, :user_id, :neighborhood_id

  has_many :comments, dependent: :destroy
  has_many :attendances, dependent: :destroy

  validates :description, presence: true,
                      length: { minimum: 6 }
  validates :title, presence: true, length: { minimum: 6 }
end
