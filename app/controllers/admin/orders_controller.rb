class Admin::OrdersController < ApplicationController
    
 def new
    @order = Order.new
 end
 
 def index
    @orders = Order.all
 end
 
  def show
    @order = Order.find(params[:id])
   
  end
  
  def edit
    @order = current_customer 
  end
  
  def update
    @order = current_customer
    if @order.update(customer_params)
      
      redirect_to admin_item_path(@order)
    else
      render 'customers/edit'
    end
  end

 
 # 投稿データの保存
 def create
    @customer = Customer.new(customer_params)
     
    @customer.save
    redirect_to admin_customers_path
 end
 
 private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:id,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email,:is_deleted)
    
  end  
  
end
