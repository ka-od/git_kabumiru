Rails.application.routes.draw do
  root  'companys#index'                        #ルートパスの指定
  
  resources :companys, only: [:show, :index] do
    collection do
      get 'search'
    end
  end
end
