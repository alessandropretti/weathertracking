Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :weather do
    member do
    end
    collection do
      get :current
    end
  end

end
