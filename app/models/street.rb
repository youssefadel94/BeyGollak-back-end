class Street < ActiveRecord::Base
     has_many :reviews, inverse_of: :street
  # validating name and area to be present   
     validates :name, :area, presence: true
  # associating the validation with reviews to set the forign key
     validates_associated :reviews
     
end
 