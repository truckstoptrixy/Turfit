Rails.application.routes.draw do

  get 'profiles/show'

  devise_for :models, :controllers => { registrations: 'registrations' }
  resources :posts do
  	resources :comments
  end

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile

	root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
