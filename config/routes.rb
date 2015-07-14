Rails.application.routes.draw do

  root 'application#index'

  scope format: true, constraints: {format: 'json'} do
    resources :images
  end

  match '*path', to: 'errors#routing', via: [:get, :head, :post, :patch, :put, :delete, :options]

end
