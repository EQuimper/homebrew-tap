cask "layout" do
  version "0.1.1"
  sha256 "901d662a43c7ea1c0d35429d4ea0af5ccdd5321c02e12b1ddb50ab1bbee9a902"

  # The repository is private: the asset comes from the GitHub API, with the credentials Homebrew
  # already uses (HOMEBREW_GITHUB_API_TOKEN, otherwise the gh login).
  url "https://api.github.com/repos/EQuimper/Layout/releases/assets/588132680",
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
