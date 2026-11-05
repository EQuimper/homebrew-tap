cask "keyhop" do
  version "1.0.2"
  sha256 "ff23376156185573407ec5111cd1e62169d604ab750fa2e3ddf61264b6048675"

  url "https://github.com/EQuimper/KeyHop/releases/download/v#{version}/KeyHop-#{version}.zip"
  name "KeyHop"
  desc "Click controls and select text with your keyboard"
  homepage "https://github.com/EQuimper/KeyHop"

  depends_on macos: :sonoma

  app "KeyHop.app"
end
