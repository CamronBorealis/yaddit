Yaddit::Application.routes.draw do
  post "user/create"

  get "messages/list"
  get "messages/:id" => 'messages#show'
end
