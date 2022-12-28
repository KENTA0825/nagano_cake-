class Order < ApplicationRecord
 
 belongs_to :customer  
 has_many :order_details
 
 enum payment_method: { credit_card: 0, transfer: 1 }
 
 def tyumon
 
 kosuu=0
 
 order_details.each do |home| 
 kosuu=kosuu+home.amount
 
 end
 
 end
 
 
end
