Rails.application.routes.draw do
  resources :players
  resources :bingo_boards
  resources :squares
  root to: 'bingo_halls#index'
  resources :bingo_halls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
