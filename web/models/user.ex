defmodule Ratingpeople.User do
  use Ratingpeople.Web, :model

  schema "users" do
    field :name, :string
    field :bio, :string
    field :photo, :string
    
    has_many :rating, Ratingpeople.Rating

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :bio, :photo])
    |> cast_assoc(:rating)
    |> validate_required([:name, :bio, :photo])
  end
end
