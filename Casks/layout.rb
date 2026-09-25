cask "layout" do
  version "0.1.3"
  sha256 "1b14760d5b0f71d8fb782fb41fcb8c3a047ce6a832751a2f4ee885894fe6a928"

  # The repository is private: the asset comes from the GitHub API, with the credentials Homebrew
  # already uses (HOMEBREW_GITHUB_API_TOKEN, otherwise the gh login).
  url "https://api.github.com/repos/EQuimper/Layout/releases/assets/588711182",
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
