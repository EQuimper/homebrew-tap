class Cmw < Formula
  desc "Fast, disk-cheap git worktrees for humans and AI agents: copy-on-write deps, .env that follows, safe cleanup, JSON output, no prompts."
  homepage "https://github.com/EQuimper/cleanmyworktree"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.1.3/cmw-aarch64-apple-darwin.tar.xz"
      sha256 "102897f4de5bc2e863468d13e79236a193360387e97ba0441c675fafb96c9831"
    end
    if Hardware::CPU.intel?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.1.3/cmw-x86_64-apple-darwin.tar.xz"
      sha256 "c1b9c996c8033684c4e67e0bc717cb3c5db247cabfb8160788d7a4bcabfaedb4"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "x86_64-apple-darwin":  {},
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

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
