Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions", registrations: 'students/registrations', passwords: 'students/passwords', confirmations: 'students/confirmations', unlocks: 'students/unlocks' }
  devise_for :teachers, path: 'teachers', controllers: { sessions: "teachers/sessions", registrations: 'teachers/registrations', passwords: 'teachers/passwords', confirmations: 'teachers/confirmations', unlocks: 'teachers/unlocks' }
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
