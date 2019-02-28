Rails.application.routes.draw do
   root to: "toppages#index"
   get "settings", to: "settings#index"
   get "signup", to: "users#new"
   
   get "login", to: "sessions#new"
   post "log", to: "sessions#create"
   delete "logout", to: "sessions#destroy"
   delete "sakuzyo", to: "topics#destroy"
   resources "myshines" 
   resources "users"
   get "ranking", to: "users#ranking"
   resources "topics"
   resources "chats"
   resources "coments"
end
