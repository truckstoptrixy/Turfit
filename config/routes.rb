Rails.application.routes.draw do

  get 'profiles/show'

  devise_for :models, :controllers => { registrations: 'registrations' }

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile


  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
    member do
      get 'like'
    end
end

end


