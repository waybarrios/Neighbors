class User < ActiveRecord::Base
    belongs_to :neighborhood
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :birthday, :gender, :name, :type_user, :username, :neighborhood_id
  #attr_accessible 
  

has_many :events, dependent: :destroy
  has_many :alerts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :attendances, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: true
  validates :name, presence: true
end
