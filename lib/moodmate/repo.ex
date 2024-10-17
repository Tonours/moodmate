defmodule Moodmate.Repo do
  use Ecto.Repo,
    otp_app: :moodmate,
    adapter: Ecto.Adapters.Postgres
end
