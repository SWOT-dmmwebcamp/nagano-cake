class Destination < ApplicationRecord
  
    belongs_to :customer
    
  validates :zipcode, presence: true, numericality: { only_integer: true}, length:{ minimum: 7, maximum: 7}
  validates :address, presence: true
  validates :delivery_name, presence: true
  
end
