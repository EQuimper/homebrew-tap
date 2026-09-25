cask "layout" do
  version "0.1.2"
  sha256 "df28f2c23316515b44e70bc38db5d24d304009eaf2f0a428fbdc3bff4308cdde"

  # The repository is private: the asset comes from the GitHub API, with the credentials Homebrew
  # already uses (HOMEBREW_GITHUB_API_TOKEN, otherwise the gh login).
  url "https://api.github.com/repos/EQuimper/Layout/releases/assets/588503730",
      header: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{GitHub::API.credentials}",
      ]
  name "Layout"
  desc "Keyboard-first window workspaces"
  homepage "https://getlayout.app"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Layout.app"

  zap trash: "~/Library/Application Support/Layout"

  caveats <<~CAVEATS
    Layout isn't notarized yet: after each install or upgrade, allow its first launch in
    System Settings > Privacy & Security > Open Anyway.
  CAVEATS
end
