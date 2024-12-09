defmodule Server.Product.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :photoUrl, :string
    field :price, :decimal

    timestamps(type: :utc_datetime)
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :photoUrl, :price])
    |> validate_required([:name, :description, :photoUrl, :price])
  end
end

