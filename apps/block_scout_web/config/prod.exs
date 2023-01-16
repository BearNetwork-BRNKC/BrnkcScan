import Config

# 對於生產，我們經常從外部加載配置
# 來源，例如您的系統環境。為此原因，
# 你不會在下面找到 :http 配置，而是在裡面設置
# BlockScoutWeb.Endpoint.init/2 當 load_from_system_env 是
＃ 真的。任何動態配置都應該在那裡完成。
#
# 不要忘記將 url host 配置為有意義的東西，
# Phoenix 在生成 URL 時使用此信息。
#
# 最後，我們還包括緩存清單的路徑
# 包含靜態文件的摘要版本。這個
# 清單由 mix phx.digest 任務生成
# 通常在構建靜態文件後運行。
config :block_scout_web, BlockScoutWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  force_ssl: false

config :block_scout_web, BlockScoutWeb.Tracer, env: "production", disabled?: true

config :logger, :block_scout_web,
  level: :info,
  path: Path.absname("logs/prod/block_scout_web.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :logger, :api,
  level: :debug,
  path: Path.absname("logs/prod/api.log"),
  metadata_filter: [fetcher: :api],
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :block_scout_web, :captcha_helper, BlockScoutWeb.CaptchaHelper
