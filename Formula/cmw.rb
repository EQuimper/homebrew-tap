class Cmw < Formula
  desc "Fast, disk-cheap git worktrees for humans and AI agents: copy-on-write deps, .env that follows, safe cleanup, JSON output, no prompts."
  homepage "https://github.com/EQuimper/cleanmyworktree"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.1.1/cmw-aarch64-apple-darwin.tar.xz"
      sha256 "ed904644f7bb879f921b28607f991af4ef839975617e547d05f895b39bf3b8f2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.1.1/cmw-x86_64-apple-darwin.tar.xz"
      sha256 "f4d6cbb3da37dd7b57298b47a1d82b2b651d3dcaae3792c9433d1a807fa2b511"
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
