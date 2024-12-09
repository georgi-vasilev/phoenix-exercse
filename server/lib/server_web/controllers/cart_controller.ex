defmodule ServerWeb.CartController do
  alias Server.Product
  alias Server.Cart
  use ServerWeb, :controller

  def get_all(conn, _params) do
    cart_pid = Server.Cart.CartServer
    cart_items = Cart.list_all(cart_pid)
    json(conn, cart_items)
  end

  def add_item(conn, %{"product_id" => product_id}) do
    cart_pid = Server.Cart.CartServer

    with :ok <- Cart.add_item(cart_pid, product_id) do
      conn |> put_status(:created) |> json(%{message: "Item added successfully"})
    else
      :error ->
        conn
        |> json(%{message: "Could not add item"})
    end
  end

  def delete_item(conn, %{"id" => product_id}) do
    cart_pid = Server.Cart.CartServer

    with :ok <- Cart.remove_item(cart_pid, product_id) do
      conn |> put_status(:created) |> json(%{message: "Item removed successfully"})
    else
      :error ->
        conn
        |> json(%{message: "Could not remove item"})
    end
  end

  def checkout(conn, %{"user" => %{"name" => name, "address" => address}}) do
    cart_pid = Server.Cart.CartServer

    order_id = System.unique_integer([:positive])

    thank_you_message =
      "Thank you #{name} for your order, #{order_id}. The products will be shipped to #{address})"

    new_line = "\r\n"

    items =
      Cart.list_all(cart_pid)
      |> Product.get_products()
      |> Enum.map(fn product ->
        "Product #{product.name}"
      end)
      |> Enum.join(", ")

    message = thank_you_message <> new_line <> items

    conn
    |> json(%{message: message})
  end
end
