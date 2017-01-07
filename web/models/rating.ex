defmodule Ratingpeople.Rating do
  use Ratingpeople.Web, :model

  schema "ratings" do
    field :vote, :integer
    belongs_to :user, Ratingpeople.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:vote, :user_id])
    |> validate_inclusion(:vote, 1..5)
    |> validate_required([:vote, :user_id])
  end
end
