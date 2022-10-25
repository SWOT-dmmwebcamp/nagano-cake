class Destination < ApplicationRecord
  
    belongs_to :customer
    
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :delivery_name, presence: true
  
end
