cask "layout" do
  version "0.10.1"
  sha256 "43c005beb8edf1cd103ef7c14cfc4dfcd0ae47c8947c2eaa0550ffd245359089"

  url "https://download.getlayout.app/Layout-#{version}.zip"
  name "Layout"
  desc "Keyboard-first window workspaces"
  homepage "https://getlayout.app"

  # Sparkle updates Layout: brew upgrade leaves it alone.
  auto_updates true
  depends_on macos: :sonoma

  app "Layout.app"
  binary "#{appdir}/Layout.app/Contents/MacOS/layoutctl"

  zap trash: "~/Library/Application Support/Layout"
end
