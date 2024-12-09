defmodule ServerWeb.Router do
  use ServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ServerWeb do
    pipe_through :api

    get "/products", ProductController, :get_all
    post "/products", ProductController, :create

    get "/cart", CartController, :get_all
    post "/cart/checkout", CartController, :checkout
    put "/cart", CartController, :add_item
    delete "/cart/:id", CartController, :delete_item
  end
end
