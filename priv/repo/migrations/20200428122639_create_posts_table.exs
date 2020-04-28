defmodule WorkshopStorage.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:username, :string, null: false)
      add(:body, :string, null: false)
      add(:likes, :integer)
      add(:published, :boolean)

      timestamps()
    end
  end
end
