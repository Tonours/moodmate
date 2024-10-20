import Config

config :moodmate, MoodmateWeb.Endpoint,
  url: [host: System.fetch_env!("HOST"), port: 443, scheme: "https"],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),
  auth_token_salt: System.fetch_env!("AUTH_TOKEN_SALT")
