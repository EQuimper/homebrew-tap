cask "layout" do
  version "0.2.0"
  sha256 "b3343a1cbbf0622714e9a1aa284ea6e03a0b76f8b89afff79c47a1552f93596a"

  url "https://download.getlayout.app/Layout-#{version}.zip"
  name "Layout"
  desc "Keyboard-first window workspaces"
  homepage "https://getlayout.app"

  # Sparkle updates Layout: brew upgrade leaves it alone.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Layout.app"

  zap trash: "~/Library/Application Support/Layout"
end
