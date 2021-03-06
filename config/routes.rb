Rails.application.routes.draw do
  devise_for :admins, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'admin#login'
  get 'authentication_failure', to: 'application#authentication_failure', as: :authentication_failure
  patch 'authentication_failure', to: 'application#authentication_failure'
  delete 'authentication_failure', to: 'application#authentication_failure'
  get 'logout', to: 'admin#logout'

  namespace 'api' do
    namespace 'v1' do
      scope 'teachers' do
        get '/', to: 'teachers#index'
        get 'show/:id', to: 'teachers#show'
        post 'create', to: 'teachers#create'
        patch 'update/:id', to: 'teachers#update'
        delete 'delete/:id', to: 'teachers#delete'
        get 'my_students/:id', to: 'teachers#my_students'
      end
      scope 'students' do
        get '/', to: 'students#index'
        get 'show/:id', to: 'students#show'
        post 'create', to: 'students#create'
        patch 'update/:id', to: 'students#update'
        delete 'delete/:id', to: 'students#delete'
      end
      scope 'languages' do
        get '/', to: 'languages#index'
        post 'create', to: 'languages#create'
        patch 'update/:id', to: 'languages#update'
        delete 'delete/:id', to: 'languages#delete'
      end
    end
  end

end
