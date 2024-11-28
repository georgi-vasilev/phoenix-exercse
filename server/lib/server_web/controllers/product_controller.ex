defmodule ServerWeb.ProductController do
  use ServerWeb, :controller

  alias Server.Product

  # Get /products
  def get_all(conn, _params) do
    products = Product.list_products()
    json(conn, products)
  end

  def create(conn, params) do
    IO.inspect(params)
    case Product.create_product(params) do
      {:ok, product} ->
        conn
        |> put_status(:created)
        |> json(product)

      {:error, _changeset} ->
        conn
        |> json(%{message: "sorry"})
    end
  end
end
