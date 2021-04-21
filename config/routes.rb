Rails.application.routes.draw do
  resources :players, :bingo_boards, :bingo_halls
  root to: 'bingo_halls#index'
  mount ActionCable.server => "/cable"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
