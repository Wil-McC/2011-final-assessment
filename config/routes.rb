Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:index]

  resources :surgeries, only: [:show, :index] do
    resources :doctors, controller: 'surgery_doctors', only: [:create]
  end
end
