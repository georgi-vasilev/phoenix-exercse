defmodule Server.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :photoUrl, :string
      add :price, :decimal
      add :description, :string
      add :cart_id, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
