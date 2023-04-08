Rails.application.routes.draw do
  root to: "home#top"
  get  "/home/about", to: "home#about", as: "about"
  devise_for :users
  # usersのルーティングがdeviseのやつより上にあると、そっちのルーティングが優先されてバグるらしい
  # 参考：https://qiita.com/iamtsujikenta/items/8f8e122ce429c2920425
  resources :books, only: [:index, :show, :create, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
