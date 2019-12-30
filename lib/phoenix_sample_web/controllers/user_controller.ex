defmodule PhoenixSampleWeb.UserController do
  use PhoenixSampleWeb, :controller

  alias PhoenixSample.Accounts
  alias PhoenixSample.Accounts.User
  alias PhoenixSample.Auth.Guardian
  alias PhoenixSampleWeb.SessionView

  action_fallback PhoenixSampleWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"email" => _, "name" => _, "password" => _} = user_params) do
    case Accounts.create_user(user_params) do
      {:ok, %User{} = user} ->
        {:ok, jwt, _claims} = Guardian.encode_and_sign(user)
        
        conn
        |> put_status(:created)
        |> put_view(SessionView)
        |> render( "show.json", %{jwt: jwt, user: user})

      {:error, _reason} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(SessionView)
        |> render("error.json")
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
