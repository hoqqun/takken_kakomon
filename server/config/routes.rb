Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :categories do
        resources :sub_categories do
          resources :questions
        end
      end
      resources :questions
    end
  end

  resources :categories do
    resources :sub_categories do
      resources :questions
    end
  end

  resources :questions
end
