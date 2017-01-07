defmodule Ratingpeople.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :bio, :string
      add :photo, :string

      timestamps()
    end

  end
end
