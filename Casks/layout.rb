cask "layout" do
  version "0.1.0"
  sha256 "c861b60fb24eb0ef74e3c43115573c84d6c9c2f2b45b8f75862e360ec8ae49a9"

  # The repository is private: the asset comes from the GitHub API, with the credentials Homebrew
  # already uses (HOMEBREW_GITHUB_API_TOKEN, otherwise the gh login).
  url "https://api.github.com/repos/EQuimper/Layout/releases/assets/586740099",
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
