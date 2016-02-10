class User < ActiveRecord::Base
     # Fields
  
  # Callbacks 
  before_create -> { self.token = SecureRandom.hex }, unless: :token? 
  # Validations
  validates :email, uniqueness: true
 # validates :email, format: { with: /\A.+\..+@student\.guc\.edu\.eg\z/ }
  
   
    #validates :password,
    #:length => { :minimum => 8 }
    

has_many :posts, inverse_of: :user
         has_many :comments, through: :posts, inverse_of: :user
         has_many :reviews, inverse_of: :user
         has_many :friendships, inverse_of: :user
         has_many :friends, through: :friendships
         has_many :notifications, inverse_of: :user
         validates_associated :reviews, :posts, :comments, :friends, :notifications, :friendships
         

  
  # Class Methods
  
  
  
  
end  

