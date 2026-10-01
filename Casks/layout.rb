cask "layout" do
  version "0.4.5"
  sha256 "bf9d1588576cc61f67c9c4d8342a04993df4c5088a74bfc0eb8e7fd6d6a2d4c2"

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
