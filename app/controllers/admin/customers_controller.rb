class Admin::CustomersController < ApplicationController
    
 def new
    @customer = Customer.new
 end
 
 def index
    @customers = Customer.all
 end
 
  def show
    @customer = Customer.find(params[:id])  
  end
  
  def edit
    @customer = Customer.find(params[:id])  
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      
      redirect_to admin_item_path(@customer.id)
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
