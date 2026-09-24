cask "smooblue" do
  version "1.31.0"
  sha256 "f1407ffb3c0b20d2d25a641e03fa7ed8fc7291ed2c636da0e20c16c6d4d21395"

  url "https://github.com/SmooAI/smooblue/releases/download/v#{version}/Smooblue-macos-arm64.zip"
  name "Smooblue"
  desc "Native multi-column Bluesky desktop client"
  homepage "https://github.com/SmooAI/smooblue"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Smooblue updates itself with Sparkle 2 (Smooblue → Check for
  # Updates…, plus an hourly check), so brew shouldn't treat an
  # in-app update as drift. `brew upgrade --greedy` still works.
  auto_updates true

  # Apple Silicon only today — the upstream release pipeline doesn't
  # ship an x86_64 macOS asset. Build from source on Intel Macs.
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Smooblue.app"

  zap trash: [
    "~/Library/Application Support/ai.Smoo.smooblue",
    "~/Library/Logs/Smooblue",
    "~/Library/LaunchAgents/ai.smoo.smooblue.updater.plist",
  ]
end
