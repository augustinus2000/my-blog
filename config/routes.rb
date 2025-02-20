Rails.application.routes.draw do
  get "home", to: "pages#home"  # PagesController의 home 액션 실행
  get "about", to: "pages#about" # PagesCOntroller의 about 액션 실행

  root "pages#home"
end  