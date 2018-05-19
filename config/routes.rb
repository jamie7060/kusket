Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'
  get 'home/rate'
  get 'home/mypage'
  get 'home/crawl'
  get 'home/submit'
  resources :home

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
