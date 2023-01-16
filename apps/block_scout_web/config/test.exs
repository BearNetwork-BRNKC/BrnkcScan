import Config

config :block_scout_web, :sql_sandbox, true

# 我們在測試期間不運行服務器。如果需要，
# 你可以啟用下面的服務器選項。
config :block_scout_web, BlockScoutWeb.Endpoint,
  http: [port: 4002],
  secret_key_base: "27Swe6KtEtmN37WyEYRjKWyxYULNtrxlkCEKur4qoV+Lwtk8lafsR16ifz1XBBYj",
  server: true,
  pubsub_server: BlockScoutWeb.PubSub,
  checksum_address_hashes: true

config :block_scout_web, BlockScoutWeb.Tracer, disabled?: false

config :logger, :block_scout_web,
  level: :warn,
  path: Path.absname("logs/test/block_scout_web.log")

# Configure wallaby
config :wallaby, screenshot_on_failure: true, driver: Wallaby.Chrome, js_errors: false

config :block_scout_web, BlockScoutWeb.Counters.BlocksIndexedCounter, enabled: false

config :block_scout_web, BlockScoutWeb.Counters.InternalTransactionsIndexedCounter, enabled: false

config :block_scout_web, :captcha_helper, BlockScoutWeb.TestCaptchaHelper

config :ueberauth, Ueberauth,
  providers: [
    auth0: {
      Ueberauth.Strategy.Auth0,
      [callback_url: "example.com/callback"]
    }
  ]
