defmodule SamtWeb.Blog.Post do
  use Phoenix.Component
  require Logger
  import Phoenix.HTML, only: [raw: 1]

  def render(assigns) do
    ~H"""
    <article>
      <h1 class="text-2xl text-zinc-600 font-bold mb-4"><%= @post.title %></h1>
      <time class="text-sm text-gray-400">
        <%= Calendar.strftime(@post.published_at, "%B %d, %Y") %>
      </time>
      <div class="content mt-5">
        <%= raw(String.replace(@post.content, "\n", "<br>")) %>
      </div>
    </article>
    """
  end
end
