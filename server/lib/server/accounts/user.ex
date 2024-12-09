defmodule Server.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :hashed_password, :string

    timestamps(type: :utc_datetime)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :hashed_password])
    |> validate_required([:name, :email, :hashed_password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end

