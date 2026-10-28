cask "budswitch" do
  version "1.0.0"
  sha256 "77e40ce9f95b0d459fdb7380cc387f96a9d79e742b44c549aab788d3713ddb1f"

  url "https://github.com/EQuimper/BudSwitch/releases/download/v#{version}/BudSwitch-#{version}.zip"
  name "BudSwitch"
  desc "Menu bar switch that moves headphones between this computer and an iPhone"
  homepage "https://github.com/EQuimper/BudSwitch"

  depends_on macos: :sonoma

  app "BudSwitch.app"

  uninstall quit: "com.equimper.BudSwitch"

  zap trash: "~/Library/Preferences/com.equimper.BudSwitch.plist"
end
