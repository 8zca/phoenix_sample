defmodule PhoenixSampleWeb.SessionController do
  use PhoenixSampleWeb, :controller

  alias PhoenixSample.Accounts
  alias PhoenixSample.Accounts.User
  alias PhoenixSample.Auth.Guardian

  def signin(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, %User{} = user} ->
        {:ok, jwt, _claims} = Guardian.encode_and_sign(user)

        conn
        |> render("show.json", %{jwt: jwt, user: user})

      {:error, _reason} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def signout(conn, _) do
    conn
    |> Guardian.Plug.sign_out(Guardian, _opts = [])
    |> render("delete.jsonn")
  end
end