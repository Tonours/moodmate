# config/releases.exs
import Config

config :moodmate, MoodmateWeb.Endpoint, auth_token_salt: System.fetch_env!("AUTH_TOKEN_SALT")
