class Public::OrdersController < ApplicationController
  
 def new
    @order = Order.new
 end
 
 def index
    @orders = Order.all
 end
 
 def show
    @order = Order.find(params[:id])  
    
    
 end


 # 投稿データの保存
 def create
    @order = Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.save!
   
    
    current_customer.cart_items.each do |cart_item| 
     order_detail=OrderDetail.new(item_id: cart_item.item.id,order_id: @order.id,price: cart_item.item.price,amount: cart_item.amount)
     order_detail.save!
   end
   current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
 end
 
 def confirm
  
  @cart_items=current_customer.cart_items
     
  @order = Order.new(order_params)
  
   @total=@cart_items.inject(0){|sum,item|sum+item.sum_of_price}
  
  if params[:order][:select_address] == "0"
  @order.postal_code = current_customer.post_code
  @order.address = current_customer.address
  @order.name = current_customer.last_name+current_customer.first_name   
  
  elsif params[:order][:select_address] == "1"
  @address = Address.find(params[:order][:address_id])
  @order.postal_code = @address.postal_code
  @order.address = @address.address
  @order.name = @address.name
  
  elsif params[:order][:select_address] == "2"
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
  else
 
  render 'new'  
  
  end
   
  end

 private
 def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name,:total_payment)
 end
    
  
    
end
