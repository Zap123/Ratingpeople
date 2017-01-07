defmodule Ratingpeople.RatingController do
  use Ratingpeople.Web, :controller

  alias Ratingpeople.Rating

  def index(conn, _params) do
    ratings = Repo.all(Rating) 
    render(conn, "index.html", ratings: ratings)
  end

  def show(conn, %{"id" => id}) do
    rating = Repo.get!(Rating, id)
    render(conn, "show.html", rating: rating)
  end

  def update(conn, %{"id" => id, "rating" => rating_params}) do
    rating = Repo.get!(Rating, id)
    changeset = Rating.changeset(rating, rating_params)

    case Repo.update(changeset) do
      {:ok, rating} ->
        conn
        |> put_flash(:info, "Rating updated successfully.")
        |> redirect(to: rating_path(conn, :show, rating))
      {:error, changeset} ->
        render(conn, "edit.html", rating: rating, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    rating = Repo.get!(Rating, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(rating)

    conn
    |> put_flash(:info, "Rating deleted successfully.")
    |> redirect(to: rating_path(conn, :index))
  end
end
