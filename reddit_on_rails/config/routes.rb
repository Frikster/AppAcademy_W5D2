Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create]
  resource :session, only:[:new,:create,:destroy]
  resources :subs, except: :destory do
    resources :posts, except: [:index, :destroy]
  end
  resources :posts, only: :destroy

end
