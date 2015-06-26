# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :articles
  resources :blogs ,only: [:index,:show]

  mount Ckeditor::Engine => '/ckeditor'
end
