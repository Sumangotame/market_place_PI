Rails.application.routes.draw do

namespace :api, defaults: { formats: :json} do
    namespace :v1 do
        resources :users
        resources :tokens, only: [ :create ]
    end
end 
end
