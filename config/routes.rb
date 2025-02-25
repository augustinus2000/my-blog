Rails.application.routes.draw do
  # 🔹 Devise 사용자 인증
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  # ✅ 수정된 프로필 라우트
  get 'users/:id/profile', to: 'users#profile', as: 'profile'

  # 🔹 게시글 및 댓글 관리
  resources :posts do
    resources :comments
    collection do
      get 'filter' # ✅ 카테고리 필터링을 위한 라우트 추가
    end
  end

  # 🔹 정적 페이지
  get "home", to: "pages#home"
  get "about", to: "pages#about"

  # 🔹 루트 페이지 설정
  root "pages#home"
end

#Rails.application.routes.draw do
 # get "users/profile"
  
  # 🔹 Devise 사용자 인증
  #devise_for :users, controllers: {
   # sessions: 'users/sessions',
    #registrations: 'users/registrations'
 # }
  
 # get 'u/:id', to: 'users#profile', as: 'user'

  # 🔹 게시글 및 댓글 관리
  #resources :posts do
   # resources :comments
    #collection do
    #  get 'filter' # ✅ 카테고리 필터링을 위한 라우트 추가
    #end
  #end

  # 🔹 정적 페이지
  #get "home", to: "pages#home"
  #get "about", to: "pages#about"

  # 🔹 루트 페이지 설정
  #root "pages#home"
#end
