Rails.application.routes.draw do
namespace :api, defaults: { formats: :json} do
    namespace :v1 do
    end
end 
end
