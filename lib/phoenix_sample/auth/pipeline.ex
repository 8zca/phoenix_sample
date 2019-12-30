defmodule PhoenixSample.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :phoenix_sample,
    error_handler: AuthMe.Auth.ErrorHandler,
    module: AuthMe.Auth.Guardian

  # If there is a session token, restrict it to an access token and validate it
  plug Guardian.Plug.VerifySession
  # If there is an authorization header, restrict it to an access token and validate it
  plug Guardian.Plug.VerifyHeader
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end