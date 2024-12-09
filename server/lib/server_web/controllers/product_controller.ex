defmodule ServerWeb.ProductController do
  use ServerWeb, :controller

  alias Server.Product

  # Get /products
  def get_all(conn, _params) do
    products = Product.list_products()
    json(conn, products)
  end

  def create(conn, %{"product" => product}) do

    case Product.create_product(product) do
      {:ok, %{:id => id, :name => name}} ->
        conn
        |> put_status(:created)
        |> json(%{"id" => id, "name" => name})

      {:error, _changeset} ->
        conn
        |> json(%{message: "sorry"})
    end
  end
end
