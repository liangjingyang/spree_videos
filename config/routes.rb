Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :products do
      resources :videos do
        collection do
          post :update_positions
        end
      end
    end
  end
end
