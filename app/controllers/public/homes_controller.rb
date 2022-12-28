class Public::HomesController < ApplicationController
   
 def top
    @homes = Order.all
 end 
 
 def about
    
 end 
 
    
end
