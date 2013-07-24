NestedResources::Application.routes.draw do

  resources :cities


  resources :states


  resources :countries


  # Site Pages
  root :to => "pages#home"
  get "/about", :to => "pages#about"
  get "/help", :to => "pages#help"
  get "/contact", :to => "pages#contact"

  # Site Resources
  shallow do 
    resources :users do
      resources :notepads do
        resources :notes
      end
    end
  end
  
  # Common Data Resources

end