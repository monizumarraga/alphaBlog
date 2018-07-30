Rails.application.routes.draw do

  resources :images
  get 'details/index'
  get 'details/new'
  get 'details/edit'
  get 'details/show'
  
  get 'user/index'
  get 'user/new'
  get 'user/edit'
  get 'user/show'
  get 'signup', to: 'users#new';
  get 'users/index';
  get 'user/welcome', to:"users#welcome"
  get 'user/contactme', to:"users#contactme";
  get 'user/about', to:"users#about"
  get 'user/profile', to: "users#profile"
  get 'user/details', to: "users#details"
  get 'users_search', to:"users#search";
  resources :users;
    
  get 'articles/index';
  get 'articles/list'  => 'articles#list';
  get 'articles/course'  => 'articles#course';
  get 'articles/computer'  => 'articles#computer';
  get 'articles/education'  => 'articles#education';
  get 'articles/project'  => 'articles#project';
  get 'articles_search', to:"articles#search";
  resources :articles;
  
  get 'details/index';
  resources :details;
  
  get 'welcome/home';
  root 'welcome#home';
  
  get 'login', to: 'sessions#new';
  post 'login', to: 'sessions#create';
  delete 'logout', to: 'sessions#destroy';
  
  get 'contact-me', to: 'messages#new', as: 'new_message'
  post 'contact-me', to: 'messages#create', as: 'create_message'
  
  resources :categories, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
