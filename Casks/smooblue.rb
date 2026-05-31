cask "smooblue" do
  version "1.5.0"
  sha256 "2de7c1765acd22254ff070c38ad697e36a704bdcca75c7c0fba559e5e0047475"

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

  # Strip the quarantine + provenance xattrs Homebrew applies after
  # download. Without this, macOS Sequoia's Gatekeeper refuses to
  # launch the .app on first run with "Apple could not verify
  # Smooblue is free of malware" and offers no GUI "Open Anyway"
  # button — the only escape hatch is a terminal command, which
  # defeats the point of a one-line cask install.
  #
  # Why this is needed: Smooblue ships adhoc-signed (`codesign --sign -`),
  # not Apple Developer ID notarized — see the README + the
  # "What's NOT done" section of docs/Security/Security.md for the
  # full why. Until we enrol in the Apple Developer Program ($99/yr)
  # and wire scripts/sign-and-notarize-macos.sh into release.yml,
  # this postflight is the cleanest install UX we can offer Homebrew
  # users without exposing them to a deadend Gatekeeper dialog.
  #
  # `brew audit --strict` flags use of xattr — that's fine, this is
  # our own tap (SmooAI/homebrew-tools) and not a homebrew/cask
  # submission. We're not bypassing user consent in any meaningful
  # sense — the user already extended trust to SmooAI when they
  # `brew tap`'d. Direct .zip downloads from the GitHub release
  # are NOT modified by this; the README documents the
  # `xattr -dr com.apple.quarantine` one-liner for that path.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Smooblue.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ai.Smoo.smooblue",
    "~/Library/Logs/Smooblue",
    "~/Library/LaunchAgents/ai.smoo.smooblue.updater.plist",
  ]
end
