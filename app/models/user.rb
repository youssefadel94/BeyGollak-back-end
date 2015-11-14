class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :posts, inverse_of: :user
         has_many :comments, through: :posts, inverse_of: :user
         has_many :reviews, inverse_of: :user
         has_many :friendships, inverse_of: :user
         has_many :friends, through: :friendships
         has_many :notifications, inverse_of: :user
         validates_associated :reviews, :posts, :comments, :friends, :notifications, :friendships

end
