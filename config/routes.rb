Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Every Ruby file in code-along/, scripts/ and labs/, and a page that runs one
  root "ruby_files#index"
  get "files/*path", to: "ruby_files#show", as: :ruby_file, format: false

  # Every table and its rows, read-only
  get "data", to: "data#show"
end
