defmodule Samt.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :content, :string
    field :published_at, :utc_datetime
    field :slug, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :published_at, :slug])
    |> validate_required([:title, :content, :published_at, :slug])
  end
end
