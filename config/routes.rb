NestedResources::Application.routes.draw do
  
  # Site Pages
  root :to => "pages#home"
  get "/about", :to => "pages#about"
  get "/help", :to => "pages#help"
  get "/contact", :to => "pages#contact"

  # Site Resources

  # Common Data Resources

end