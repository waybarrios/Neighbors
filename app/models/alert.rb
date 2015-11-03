class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood
  attr_accessible :description, :user_id, :neighborhood_id
  
  validates :description, presence: true,
                      length: { minimum: 6 }
  
end
