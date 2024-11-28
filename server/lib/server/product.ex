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
  def create_product(attrs \\ %{}) do
    IO.inspect("in create_product before repo.create")
    IO.inspect(attrs)
    %{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

end

