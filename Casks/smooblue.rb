cask "smooblue" do
  version "1.2.1"
  sha256 "412e67dd268ce44d9ea2b9e554b786c398a4b3de0fe2f416715c822d18b557ea"

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
