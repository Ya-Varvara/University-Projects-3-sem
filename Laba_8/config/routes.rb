# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'armstrongs_numbers/input'
  get 'armstrongs_numbers/view'
  root 'armstrongs_numbers#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
