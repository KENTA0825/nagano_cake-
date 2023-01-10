class Admin::ItemsController < ApplicationController
    
 def new
    @item = Item.new
 end
 
 def index
    @items = Item.all
 end
 
  def show
    @item = Item.find(params[:id])  
  end
  
  def edit
    @item = Item.find(params[:id])  
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      
      redirect_to admin_item_path(@item.id)
    else
      render 'items/edit'
    end
end

 
 # 投稿データの保存
 def create
    @item = Item.new(item_params)
     
    @item.save
    redirect_to admin_item_path(@item.id)
 end
 
 private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:image, :name,:introduction,:price)
  end
end
