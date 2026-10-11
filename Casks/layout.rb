cask "layout" do
  version "0.6.3"
  sha256 "4012b9a229c982f7f94a99bcaf7f3e01384b569da747af82af3fe9939be38651"

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
