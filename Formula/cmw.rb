class Cmw < Formula
  desc "Fast, disk-cheap git worktrees for humans and AI agents: copy-on-write deps, .env that follows, safe cleanup, JSON output, no prompts."
  homepage "https://github.com/EQuimper/cleanmyworktree"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.2.0/cmw-aarch64-apple-darwin.tar.xz"
      sha256 "e54952baededf361547fff3e6ff6276e8619ac44e5a9c854ea529d97ac32444e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.2.0/cmw-x86_64-apple-darwin.tar.xz"
      sha256 "b27bf169e4f9f74318f60fcd1693faff404bbdfdb103d9021ecb25ce21b9470f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.2.0/cmw-aarch64-unknown-linux-musl.tar.xz"
      sha256 "acf338e70bf382b2edf5d748b6da9910208ea3b1dc024ef2755f73964b5903ee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.2.0/cmw-x86_64-unknown-linux-musl.tar.xz"
      sha256 "0c13053e09d7788da68867036546dd712425befa91dc98f1950b265d6867d55d"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cmw"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "cmw"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "cmw"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "cmw"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
