cask "keyhop" do
  version "1.0.3"
  sha256 "8e75259a931b1b0b03f3a06e7619dabe84276d912fb4a2021142bb218fa79914"

  url "https://github.com/EQuimper/KeyHop/releases/download/v#{version}/KeyHop-#{version}.zip"
  name "KeyHop"
  desc "Click controls and select text with your keyboard"
  homepage "https://github.com/EQuimper/KeyHop"

  depends_on macos: :sonoma

  app "KeyHop.app"
end
