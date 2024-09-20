defmodule SamtWeb.Blog.List do
  use Phoenix.Component
  alias SamtWeb.Blog.PostSummary

  def render(assigns) do
    posts = Samt.Blog.list_posts()

    ~H"""
    <%= for post <- posts do %>
      <PostSummary.render post={post} />
    <% end %>
    """
  end
end
