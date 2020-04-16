Rails.application.routes.draw do
  root  'companys#index'                        #ルートパスの指定
  
  resources :companys, only: [:show, :index]
  
end
