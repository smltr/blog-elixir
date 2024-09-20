defmodule Samt.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :text
      add :published_at, :utc_datetime
      add :slug, :string

      timestamps(type: :utc_datetime)
    end
  end
end
