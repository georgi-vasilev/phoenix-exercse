defmodule Server.Product do
  alias Server.Repo
  alias Server.Product.Product

  @doc """
  List all products
  """
  def list_products() do
    Repo.all(Product)
    |> Enum.map(fn product ->
      product.name
    end)
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

  def get_products(products) do
    products
    |> Map.keys()
    |> Enum.map(fn p_id ->
      Repo.get(Product, p_id)
    end)
  end

  def exists(produt_id) do
    Repo.get(Product, produt_id)
  end
end
