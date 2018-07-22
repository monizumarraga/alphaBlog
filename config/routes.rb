Rails.application.routes.draw do
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
  get 'welcome/about';
  get 'welcome/cv';
  root 'welcome#home';
  
  get 'login', to: 'sessions#new';
  post 'login', to: 'sessions#create';
  delete 'logout', to: 'sessions#destroy';
  
  resources :categories, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
