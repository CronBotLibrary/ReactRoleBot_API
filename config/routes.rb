Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :panels
      resources :roles
    end
  end
end
