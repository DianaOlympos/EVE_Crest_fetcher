use Mix.Config

  config :fetch_crest_market,
    crest_rate: 150,
    crest_public_address: "https://public-crest.eveonline.com/",
    user_agent: "diana https://github.com/DianaOlympos/EVE_Crest_fetcher"

  config :logger, :console, format: "[$level] $message\n"