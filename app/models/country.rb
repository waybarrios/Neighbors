class Country < ActiveRecord::Base
  attr_accessible :name, :country_id

  has_many :cities, dependent: :destroy
  
  validates :name, presence: true,
                      length: { minimum: 6 }
end
