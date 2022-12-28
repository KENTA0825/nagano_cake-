Rails.application.routes.draw do
 
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}



# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
scope module: :public do
   get"/"=>"homes#top"
   get"/about"=>"homes#about"
   resources :genres
   resources :items
   
   get"/customers/my_page"=>"customers#show"
   get"/customers/information/edit"=>"customers#edit"
   patch"/customers/information"=>"customers#update"
   get"/customers/unsubscribe"=>"customers#unsubscribe"
   patch"/customers/withdraw"=>"customers#withdraw"
   
   get"/orders/new"=>"orders#new"
   post"/orders/confirm"=>"orders#confirm"
   get"/orders/complete"=>"orders#complete"
   post"/orders"=>"orders#create"
   get"/orders"=>"orders#index"
   get"/orders/:id"=>"orders#show"
   
   delete"/cart_items/destroy_all"=>"cart_items#destroy_all"
   resources :cart_items
   
   
end

namespace :admin do
    
   get"/"=>"homes#top"
   resources :genres
   resources :items
   resources :customers
   resources :orders
   
end

end
