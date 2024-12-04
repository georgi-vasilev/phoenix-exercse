defmodule Server.Product do
  alias Server.Repo
  alias Server.Product.Product

  @doc """
  List all products
  """
  def list_products() do
    Repo.all(Product)
  end

  @doc """
  Creates a product.
  """
  def create_product(
        %{
          "cart_id" => cart_id,
          "description" => description,
          "name" => name,
          "photoUrl" => photoUrl,
          "price" => price
        } = attrs \\ %{}
      ) do
    IO.inspect("in create_product before repo.create")
    IO.inspect(attrs)

    %Product{}
    |> Product.changeset(%{
      cart_id: cart_id,
      description: description,
      name: name,
      photoUrl: photoUrl,
      price: price
    })
    |> Repo.insert()
  end
end
