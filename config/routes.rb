Rails.application.routes.draw do
  root "feed_items#index"

  resources :feeds do
    member do
      post :mark_all_as_read
    end

    collection do
      post :refresh
    end
  end

  resources :feed_items, only: [:index, :show] do
    member do
      post :mark_as_read
    end

    collection do
      post :mark_all_as_read
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
