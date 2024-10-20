import Config

config :moodmate, MoodmateWeb.Endpoint,
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),
  auth_token_salt: System.fetch_env!("AUTH_TOKEN_SALT")
