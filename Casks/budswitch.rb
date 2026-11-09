cask "budswitch" do
  version "1.0.1"
  sha256 "1ea47a0226139d89aa91fe776a35a41d3d85fbb070709153830d80af8c7b8d2e"

  url "https://github.com/EQuimper/BudSwitch/releases/download/v#{version}/BudSwitch-#{version}.zip"
  name "BudSwitch"
  desc "Menu bar switch that moves headphones between this computer and an iPhone"
  homepage "https://github.com/EQuimper/BudSwitch"

  depends_on macos: :sonoma

  app "BudSwitch.app"

  uninstall quit: "com.equimper.BudSwitch"

  zap trash: "~/Library/Preferences/com.equimper.BudSwitch.plist"
end
