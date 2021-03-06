class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :username, presence: true, uniqueness: true


  has_many :workouts
  has_many :favorites
  has_many :favorites, through: :favorites, source: :workout

  
end
