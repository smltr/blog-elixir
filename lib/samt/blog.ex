defmodule Samt.Blog do
  import Ecto.Query
  alias Samt.Repo
  alias Samt.Blog.Post

  @doc """
  Return all posts ordered from newest to oldest.
  """
  def list_posts do
    Repo.all(from p in Post, order_by: [desc: p.published_at])
  end

  def get_post_by_slug!(slug) do
    Repo.get_by!(Post, slug: slug)
  end
end
