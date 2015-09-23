# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  devise_for :users
  root 'articles#welcome'

  resources :articles
  resources :classifications

  namespace :interface do
    resources :articles, :only => [] do
      collection do
        get :all_articles
        get :article_details
      end
    end
  end

  mount Ckeditor::Engine => '/ckeditor'
end
