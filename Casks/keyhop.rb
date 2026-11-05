cask "keyhop" do
  version "1.0.0"
  sha256 "18062ae4f3cee3cc6b2edcdc1d6607d43f10246f04dffe57fe843245aa22bcb0"

  url "https://github.com/EQuimper/KeyHop/releases/download/v#{version}/KeyHop-#{version}.zip"
  name "KeyHop"
  desc "Click controls and select text with your keyboard"
  homepage "https://github.com/EQuimper/KeyHop"

  depends_on macos: :sonoma

  app "KeyHop.app"
end
