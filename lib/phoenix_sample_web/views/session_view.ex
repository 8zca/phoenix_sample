defmodule PhoenixSampleWeb.SessionView do
  use PhoenixSampleWeb, :view

  def render("show.json", %{jwt: jwt, user: user}) do
    %{
      data: render_one(user, PhoenixSampleWeb.UserView, "user.json"),
      meta: %{token: jwt}
    }
  end

  def render("error.json", _params) do
    %{error: "Invalid email/password"}
  end

  def render("delete.json", _params) do
    %{ok: true}
  end
end