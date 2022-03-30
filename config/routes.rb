Rails.application.routes.draw do
  get 'applications/index'
  root 'applications#index'
  scope '/api' do
    resources :applications
    resources :chatis
    get 'applications/:token/chatis/:id/edit' => 'chatis#edit'
    get 'applications/:token/chatis/create' => 'chatis#new'
    get '/applications/:token/chatis/:id' => 'chatis#show', as: :getChat
    get '/applications/:token/chatis' => 'chatis#getAppsChatis', as: :appsChats
    patch 'applications/:authenticity_token/chatis/:id/edit' => 'chatis#update', as: :updateChat
    post 'applications/:authenticity_token/chatis/create' => 'chatis#create', as: :createChat

    get 'applications/:token/chatis/:chati_id/messages' => 'messages#getChatsMessages'
    post 'applications/:token/chatis/:chati_id/messages/create' => 'messages#create'
    patch 'applications/:token/chatis/:chati_id/messages/:id/edit' => 'messages#update'
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
end
