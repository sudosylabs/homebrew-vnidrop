# Homebrew cask for the direct-download (notarized .dmg) macOS build.
#
# This file is the source template. The Apple release workflow substitutes the
# version + sha256 for each release and pushes the result to the tap repo
# (sudosylabs/homebrew-vnidrop, path Casks/vnidrop.rb). Users then install with:
#   brew install --cask sudosylabs/vnidrop/vnidrop
#
# `auto_updates true` tells Homebrew that the app updates itself via Sparkle, so
# `brew upgrade` won't fight the in-app updater.
cask "vnidrop" do
  version "0.3.2"
  sha256 "e2400a3aa4cd7080c154f3ca594d2d1024012118f91b41c307fdf876bc664598"

  url "https://github.com/sudosylabs/vnidrop/releases/download/v#{version}/VniDrop-#{version}.dmg",
      verified: "github.com/sudosylabs/vnidrop/"
  name "VniDrop"
  desc "Direct device-to-device file and folder transfer over the network"
  homepage "https://github.com/sudosylabs/vnidrop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "VniDrop.app"

  zap trash: [
    "~/Library/Application Support/com.vnidrop.app",
    "~/Library/Caches/com.vnidrop.app",
    "~/Library/Preferences/com.vnidrop.app.plist",
  ]
end
