class City < ActiveRecord::Base
  belongs_to :country
  attr_accessible :name, :country_id

  has_many :neighborhoods, dependent: :destroy

  validates :name, presence: true,
                      length: { minimum: 6 }
end
