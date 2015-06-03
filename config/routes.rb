# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  root 'welcome#index'

  resources :articles
  resources :blogs ,only: [:index,:show]

  mount Ckeditor::Engine => '/ckeditor'
end
