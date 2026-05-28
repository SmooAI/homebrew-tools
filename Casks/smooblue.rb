cask "smooblue" do
  version "1.2.1"
  sha256 "5d4e1fca68b16a10c94b8e50f0a5023cfaf582568c3871496dbc500b7249e417"

  url "https://github.com/SmooAI/smooblue/releases/download/v#{version}/Smooblue-macos-arm64.zip"
  name "Smooblue"
  desc "Native multi-column Bluesky desktop client"
  homepage "https://github.com/SmooAI/smooblue"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Apple Silicon only today — the upstream release pipeline doesn't
  # ship an x86_64 macOS asset. Build from source on Intel Macs.
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Smooblue.app"

  # Note: this build is adhoc-signed, not Apple Developer ID notarized.
  # Homebrew Cask downloads do NOT carry the quarantine xattr that
  # Safari-downloaded apps do, so Gatekeeper should let Smooblue
  # launch on first run without the right-click-to-open dance. If
  # Gatekeeper does balk for any reason, `xattr -dr com.apple.quarantine
  # /Applications/Smooblue.app` clears the bit.

  zap trash: [
    "~/Library/Application Support/ai.Smoo.smooblue",
    "~/Library/Logs/Smooblue",
    "~/Library/LaunchAgents/ai.smoo.smooblue.updater.plist",
  ]
end
