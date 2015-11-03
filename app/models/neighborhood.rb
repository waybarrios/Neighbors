class Neighborhood < ActiveRecord::Base
  belongs_to :city
  attr_accessible :name, :city_id

  has_many :users, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :alerts, dependent: :destroy

  validates :name, presence: true,
                      length: { minimum: 6 }
end
