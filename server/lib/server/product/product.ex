defmodule Server.Product.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :photoUrl, :string
    field :price, :decimal
    field :cart_id, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :photoUrl, :price, :cart_id])
    |> validate_required([:name, :description, :photoUrl, :price, :cart_id])
  end
end
