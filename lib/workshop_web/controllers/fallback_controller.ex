defmodule WorkshopWeb.FallbackController do
  use WorkshopWeb, :controller
  alias WorkshopWeb.ErrorView

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ErrorView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, :error) do
    conn
    |> put_status(:unprocessable_entity)
    |> json(%{error: "could not process request"})
  end
end
