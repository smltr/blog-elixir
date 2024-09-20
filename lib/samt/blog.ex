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

  @doc """
  Return the n most recent posts ordered from newest to oldest.
  """
  def get_recent_posts(n_posts) do
    Repo.all(from p in Post, order_by: [desc: p.published_at], limit: ^n_posts)
  end

  @doc """
  Get a post by its slug.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post_by_slug!("example-post")
      %Post{}

      iex> get_post_by_slug!("non-existent-post")
      ** (Ecto.NoResultsError)

  """
  def get_post_by_slug!(slug) do
    Repo.get_by!(Post, slug: slug)
  end
end
