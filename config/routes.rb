Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/zillow'

  get 'welcome/trulia'

  get 'welcome/listglobally'

  get 'welcome/blackknight'

  get 'welcome/propertyvalue'

  get 'welcome/mediansales'

  get 'welcome/propertyinformationreport'

  get 'welcome/comparablesales'

  get 'welcome/neighborhoodv'

  get 'welcome/annualpercentage'

  get 'welcome/unitsales'

  get 'welcome/salesbyrange'

  get 'welcome/forclosures'

  get 'welcome/hoodlinetest'

  get 'welcome/marketreports'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
