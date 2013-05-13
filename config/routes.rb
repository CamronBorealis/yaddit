Yaddit::Application.routes.draw do
  get 'user/register' => 'user#new'
  post "user/create"

  get "messages/list"
  get "messages/:id" => 'messages#show'
end
