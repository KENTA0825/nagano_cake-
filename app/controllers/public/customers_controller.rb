class Public::CustomersController < ApplicationController
    
 def new
    @customer = Customer.new
 end
 
 def index
    @customers = Customer.all
 end
 
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer 
  end
  
  def withdraw
    @customer = current_customer
    if @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    else
      render 'customers/edit'
    end
  end
  
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      
      redirect_to customers_my_page_path
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
