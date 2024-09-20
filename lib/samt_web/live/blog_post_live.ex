defmodule SamtWeb.BlogPostLive do
  use SamtWeb, :live_view
  alias SamtWeb.Blog.Post
  alias Samt.Blog

  def mount(%{"slug" => slug}, _session, socket) do
    post = Blog.get_post_by_slug!(slug)
    {:ok, assign(socket, post: post)}
  end

  def render(assigns) do
    ~H"""
    <Post.render post={@post} />
    """
  end
end
