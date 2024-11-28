defmodule Mix.Tasks.Blog.Post do
  use Mix.Task

  @shortdoc "Insert a blog post from a markdown file"
  def run([file_path, title, slug]) do
    {:ok, _} = Application.ensure_all_started(:samt)

    content = File.read!(file_path)

    Samt.Blog.create_post(%{
      title: title,
      content: content,
      slug: slug,
      published_at: DateTime.utc_now()
    })
  end
end
