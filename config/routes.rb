Yaddit::Application.routes.draw do
  root :to => "messages#list"
  
  post "session/create"
  get "logout" => "session#destroy", :as=>:logout
  get "login" => "session#log_in", :as=>:login

  get 'register' => 'user#new', :as=>:register
  post "user/create"

  get "messages/list"
  get "messages/new"
  get "messages/:id" => 'messages#show', :as=>:messages_show
  post "messages/create"
  post "messages/reply"
end
