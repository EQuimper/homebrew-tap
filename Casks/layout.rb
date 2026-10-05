cask "layout" do
  version "0.4.14"
  sha256 "551b5a2a95a0809abd99b1f6f48315887aa05bd4ac94cea0314b861d497aa867"

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
