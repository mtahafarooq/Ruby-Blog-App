Rails.application.routes.draw do
  
  get 'users/show'

  get 'welcome/index'
 
  resources :articles do
  	resources :comments
  end


  
#get '/users/sign_in', to: redirect("/sign-in")
#get '/users/sign_up', to: redirect("/sign-up")


devise_for :users, :skip => [:sessions, :registrations] 
  #root 'welcome#index'

   devise_scope :user do
    get    "sign-in",  to: "devise/sessions#new",         as: :new_user_session
    post   "sign-in",  to: "devise/sessions#create",      as: :user_session
    delete "sign-out", to: "devise/sessions#destroy",     as: :destroy_user_session
 
    get    "sign-up",  to: "devise/registrations#new",    as: :new_user_registration
    post   "sign-up",  to: "devise/registrations#create", as: :user_registration
end

 resources :users  do
  resources :articles
end
root 'welcome#index'

end