defmodule Server.Cart do
  alias Server.Cart.CartServer
  alias Server.Product

  def list_all(cart_pid) do
    CartServer.list_all(cart_pid)
  end

  def add_item(cart_pid, product_id) do
    product = Product.exists(product_id)
    IO.inspect(product)

    if product !== nil do
      CartServer.add_item(cart_pid, product_id)
    else
      :error
    end
  end

  def remove_item(cart_pid, product_id) do
    CartServer.remove_item(cart_pid, product_id)
  end
end
