Rails.application.routes.draw do
  get '/' => 'home#top'

  get 'posts/index' => 'posts#index'
  get 'posts/index/:department_id' => 'posts#department'
  get 'posts/index/:department_id/:semester_id' => 'posts#semester'
  get 'posts/index/:department_id/:semester_id/:id' => 'posts#subject'

  post 'posts/:id/create' => 'posts#create'
  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  get 'users/:id' => 'users#show'
  get "signup" => "users#new"
  post 'users/create' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'
end
