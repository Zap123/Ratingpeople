defmodule Ratingpeople.PageController do
  require Logger 

  use Ratingpeople.Web, :controller
  alias Ratingpeople.User
  alias Ratingpeople.Rating

  def index(conn, _params) do
    user = random_user() 
    vote = average_vote(user.id)
    changeset = Rating.changeset(%Rating{}) 

    render conn, "index.html", user: user, vote: vote, changeset: changeset
  end
  
  def vote(conn, %{"rating" => params}) do
	changeset = Rating.changeset(%Rating{}, params)
		
	case Repo.insert(changeset) do
	{:ok, _rating} -> 
	   conn |> 
	   redirect(to: page_path(conn, :index))
	{:error, changeset} -> 
           conn |>
	   put_flash(:info, "A problem occured while sending the vote")
	end
  end
  
  defp random_user() do
    query = from u in User, 
	    order_by: fragment("random()"),
	    limit: 1
    user = Repo.all(query) |> hd
  end 
  
  defp average_vote(user_id) do
    query = from r in Rating,
            select: fragment("?::float",avg(r.vote)),
	    where: r.user_id == ^user_id 
    avg = Repo.all(query) 

    avg |> hd |> Float.to_string(decimals: 2)
  end

end
