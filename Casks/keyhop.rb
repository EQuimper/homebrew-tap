cask "keyhop" do
  version "1.0.1"
  sha256 "82ab1ade877da35da99ebdc2fe23942b87617a5b83d04f1da6baa71b1692aaad"

  url "https://github.com/EQuimper/KeyHop/releases/download/v#{version}/KeyHop-#{version}.zip"
  name "KeyHop"
  desc "Click controls and select text with your keyboard"
  homepage "https://github.com/EQuimper/KeyHop"

  depends_on macos: :sonoma

  app "KeyHop.app"
end
