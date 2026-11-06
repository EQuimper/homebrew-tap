cask "keyhop" do
  version "1.0.4"
  sha256 "44dc50db3444adf5036a98cf242a2700ca94f44cf83da4690ba9335129c315ed"

  url "https://github.com/EQuimper/KeyHop/releases/download/v#{version}/KeyHop-#{version}.zip"
  name "KeyHop"
  desc "Click controls and select text with your keyboard"
  homepage "https://github.com/EQuimper/KeyHop"

  depends_on macos: :sonoma

  app "KeyHop.app"
end
