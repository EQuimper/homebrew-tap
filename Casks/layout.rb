cask "layout" do
  version "0.3.0"
  sha256 "b67a42ec72d7e1b426a97fab2bed04777217e48898c84f6a1db7628ae0027b81"

  url "https://download.getlayout.app/Layout-#{version}.zip"
  name "Layout"
  desc "Keyboard-first window workspaces"
  homepage "https://getlayout.app"

  # Sparkle updates Layout: brew upgrade leaves it alone.
  auto_updates true
  depends_on macos: :sonoma

  app "Layout.app"

  zap trash: "~/Library/Application Support/Layout"
end
