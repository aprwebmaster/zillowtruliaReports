Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/zillow'

  get 'welcome/trulia'

  get 'welcome/listglobally'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
