cask "layout" do
  version "0.8.2"
  sha256 "8a20989131e05f4e5861425d921b3a95b4ffe093923dc603bef60669821e7bbe"

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
