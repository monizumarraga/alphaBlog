Rails.application.routes.draw do
  resources :articles;
  get 'articles/index';
  get 'welcome/home';
  get 'welcome/about';
  get 'welcome/cv';
  root 'welcome#home';

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
