Rails.application.routes.draw do
  get 'post_threds/post'
  get 'bbs/show'
  get 'bbs/show/:id' => 'bbs#show_bbs'
  post 'responces' => 'bbs#post_responce'
  post 'responce_children' => 'bbs#post_res_child'
  post 'threds' => 'post_threds#post_thred'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
