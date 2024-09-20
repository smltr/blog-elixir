defmodule SamtWeb.Blog.Post do
  use Phoenix.Component
  require Logger
  import Phoenix.HTML, only: [raw: 1]

  def render(%{current_page: {:blog_post, slug}} = assigns) do
    post =
      try do
        Samt.Blog.get_post_by_slug!(slug)
      rescue
        Ecto.NoResultsError ->
          Logger.warning("Post not found: #{slug}")
          nil

        e ->
          Logger.error("Database error: #{inspect(e)}")
          nil
      end

    assigns = assign(assigns, :post, post)

    ~H"""
    <%= if @post do %>
      <div class="blog-post">
        <article class="post">
          <h1 class="text-3xl font-bold"><%= @post.title %></h1>
          <time class="text-sm text-gray-400">
            <%= Calendar.strftime(@post.published_at, "%B %d, %Y") %>
          </time>
          <div class="content mt-5">
            <%= raw(String.replace(@post.content, "\n", "<br>")) %>
          </div>
        </article>
      </div>
    <% else %>
      <div class="error">Post not found or an error occurred</div>
    <% end %>
    """
  end
end
