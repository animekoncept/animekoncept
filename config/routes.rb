Rails.application.routes.draw do

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_scope :user do
    authenticated :user do
      root :to => 'home#show'
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  #root 'home#index'
  get 'search/index'

  get 'home/show' => 'home#show', as: 'home', path: 'home'

  resources :microposts do
    member do
      put 'like', to: 'microposts#like'
      put 'unlike', to: 'microposts#unlike'
    end
  end

  resources :activities

  devise_for :users

  resources :users, only: [:show] do
    get '/forum' => 'users#forum'
    get '/events' => 'users#events'
    get '/animelist' => 'users#animelist'
    member do
      put 'following', to: 'users#following'
      put 'unfollow', to: 'users#unfollow'
    end
  end
  resources :animes, path: "anime" do
    #resources :animelists, only: [:create, :destroy, :update], path_names: { create: "add", destroy: "remove", update: "edit" }#-> url.com/animes/:anime_id/add
    #patch 'animes/:anime_id/animelists/:id', controller: 'animelists', action: :update
    resources :animelists, only: [:create, :destroy, :update]
    resources :reviews
    member do
      put 'favorite', to: 'animes#favorite'
      put 'unfavorite', to: 'animes#unfavorite'
      put 'like', to: 'animes#like'
      put 'unlike', to: 'animes#unlike'
      put 'hate', to: 'animes#hate'
      put 'unhate', to: 'animes#unhate'
    end
  end
  get 'popular/anime', to: 'animes#popular'
  get 'year/anime', to: 'animes#year'

  resources :categories, path: 'c' do
    resources :topics, path: 't'
  end

  resources :events do
    member do
      put 'attending', to: 'events#attending'
      put 'notattending', to: 'events#notattending'
    end
  end

  resources :topics, path: 't' do
    resources :posts
  end
  get 'topics/top' => 'topics#top', path: 'top', as: 'top_topics'
  get 'topics/latest' => 'topics#latest', path: 'latest', as: 'latest_topics'

  resources :posts do
    member do
      put 'like', to: 'posts#like'
      put 'unlike', to: 'posts#unlike'
    end
  end

  get 'animelist/:user_id' => 'animelists#show', as: 'animelist/user', path: 'animelist/:user_id'


  resources :genres, path: "genre"

  resources :seasons, path: "season"

  resources :producers, path: "producer"

  resources :groups do
    resources :comments do
      member do
        put 'like', to: 'comments#like'
        put 'unlike', to: 'commments#unlike'
      end
    end
    member do
      put 'join', to: 'groups#join'
      put 'unjoin', to: 'groups#unjoin'
    end
  end

  resources :comments do

  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
