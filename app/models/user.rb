class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :workouts
  has_many :favorites
  has_many :favorites, through: :favorites, source: :workout

  validates :username, :first_name, :last_name, :email, :password, presence: true
end
