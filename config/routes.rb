Rails.application.routes.draw do
  get 'signup', to: 'users#new';
  get 'users/index';
  resources :users;
    
  get 'articles/index';
  get 'articles/course'  => 'articles#course';
  get 'articles/computer'  => 'articles#computer';
  get 'articles/education'  => 'articles#education';
  get 'articles/project'  => 'articles#project';
  resources :articles;
  
  get 'welcome/home';
  get 'welcome/about';
  get 'welcome/cv';
  root 'welcome#home';
  
  
  get 'login', to: 'sessions#new';
  post 'login', to: 'sessions#create';
  delete 'logout', to: 'sessions#destroy';
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
