Rails.application.routes.draw do
  resources :tasks
  resources :boards do
    resources :tasklists
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
