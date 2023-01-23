import Config

# 對於開發，我們禁用任何緩存並啟用
# 調試和代碼重新加載。
#
# watchers 配置可用於運行外部
# 觀察者到您的應用程序。例如，我們使用它
# 使用 webpack 重新編譯 .js 和 .css 源。

config :block_scout_web, BlockScoutWeb.Endpoint,
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# ## SSL Support
#
# 為了在開發中使用 HTTPS，一個自簽名的
# 可以通過運行以下命令生成證書
# 來自終端的命令：
#
#     openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout priv/server.key -out priv/server.pem
#
# 上面的 `http:` 配置可以替換為：
#
#     https: [port: 4000, keyfile: "priv/server.key", certfile: "priv/server.pem"],
#
# 如果需要，`http:` 和 `https:` 鍵都可以
# 配置為同時運行 http 和 https 服務器
# 不同的端口。

# 觀看瀏覽器重新加載的靜態和模板。
config :block_scout_web, BlockScoutWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/block_scout_web/views/.*(ex)$},
      ~r{lib/block_scout_web/templates/.*(eex)$}
    ]
  ]

config :block_scout_web, BlockScoutWeb.Tracer, env: "dev", disabled?: true

config :logger, :block_scout_web,
  level: :debug,
  path: Path.absname("logs/dev/block_scout_web.log")

config :logger, :api,
  level: :debug,
  path: Path.absname("logs/dev/api.log"),
  metadata_filter: [fetcher: :api]

# 在開發期間設置更高的堆棧跟踪。避免配置這樣的
# 在生產中構建大型堆棧跟踪可能很昂貴。
config :phoenix, :stacktrace_depth, 20

config :block_scout_web, :captcha_helper, BlockScoutWeb.CaptchaHelper
