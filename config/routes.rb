Rails.application.routes.draw do

  post ':user_name/follow_model', to: 'relationships#follow_model', as: :follow_model
  post ':user_name/unfollow_model', to: 'relationships#unfollow_model', as: :unfollow_model

  get 'relationships/follow_model'

  get 'relationships/unfollow_model'

  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through

  get 'notifications', to: 'notifications#index'

  get 'profiles/show'

  get 'conversations', to: 'conversations#index', as: :conversations_path

  get 'browse', to: 'posts#browse', as: :browse_posts

  devise_for :models, :controllers => { registrations: 'registrations' }

  root 'posts#index'

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  resources :conversations do
    resources :messages
  end

  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end
end