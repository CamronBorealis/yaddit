Yaddit::Application.routes.draw do
  root :to => "messages#list"
  
  post "session/create"
  get "session/destroy"
  get "session/log_in"

  get 'user/register' => 'user#new'
  post "user/create"

  get "messages/list"
  get "messages/new"
  get "messages/:id" => 'messages#show'
  post "messages/create"
  post "messages/reply"
end
