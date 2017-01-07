defmodule Ratingpeople.Repo.Migrations.CreateRating do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :vote, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:ratings, [:user_id])

  end
end
