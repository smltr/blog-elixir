defmodule SamtWeb.Blog.PostSummary do
  use Phoenix.Component
  use SamtWeb, :html
  require Logger

  def render(assigns) do
    ~H"""
    <div class="mb-10">
      <article>
        <h2 class="text-lg font-bold">
          <.link href={~p"/blog/#{@post.slug}"}><%= @post.title %></.link>
        </h2>
        <p class="text-sm text-gray-400 mt-1">
          <%= Calendar.strftime(@post.published_at, "%B %d, %Y") %>
        </p>
        <p class="mt-1">
          <%= String.slice(@post.content, 0, 125) <> "..." %>
        </p>
      </article>
    </div>
    """
  end
end
