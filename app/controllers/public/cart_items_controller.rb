class Public::CartItemsController < ApplicationController
    
 def index
    @cart_items = current_customer.cart_items.all
    @total=@cart_items.inject(0){|sum,item|sum+item.sum_of_price}
 end
  
 def update
    cart_item = CartItem.find(params[:id])  
    #if @customer.update(customer_params)
    cart_item.amount = cart_item_params[:amount].to_i
    cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path
    #else
      #render 'customers/edit'
 end
    
 def create
     
    @item= Item.find(params[:cart_item][:item_id]) 
    @cart_item =current_customer.cart_items
    @cart_item.each do |item| 
    if @item.id ==item.item_id
         @same= item.amount.to_i+params[:cart_item][:amount].to_i
         item.update(amount: @same)
         redirect_to cart_items_path
         return 0
    end 
   end
    @cart_item =current_customer.cart_items.build(cart_item_params)
    @cart_item.save
    
    
    redirect_to cart_items_path
 end
 
 def destroy
    cart_item = CartItem.find(params[:id])  
    cart_item.destroy  
    redirect_to cart_items_path
 end 
 
 def destroy_all
   current_customer.cart_items.destroy_all
   redirect_to cart_items_path
 end 
 
 
 
 private
  # ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount,:customer_id)
    
  end 
    
end
