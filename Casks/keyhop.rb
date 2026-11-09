cask "keyhop" do
  version "1.0.5"
  sha256 "a0f0262e3134e4693b82626ef5ec3806fc3be041c9240ef8e2f4943cf5d8a8f8"

  url "https://github.com/EQuimper/KeyHop/releases/download/v#{version}/KeyHop-#{version}.zip"
  name "KeyHop"
  desc "Click, select text and scroll with your keyboard"
  homepage "https://github.com/EQuimper/KeyHop"

  depends_on macos: :sonoma

  app "KeyHop.app"
end
