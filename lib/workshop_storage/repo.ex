defmodule WorkshopStorage.Repo do
  use Ecto.Repo, otp_app: :workshop, adapter: Ecto.Adapters.Postgres
end
