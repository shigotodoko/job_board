Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:update, :destroy]

  get '/obrigado-anuncio-enviado-com-sucesso' => 'posts#success', as: :post_success

  get '/feedback', to: 'feedbacks#index', as: :feedback
end
