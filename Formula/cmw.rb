class Cmw < Formula
  desc "Fast, disk-cheap git worktrees for humans and AI agents: copy-on-write deps, .env that follows, safe cleanup, JSON output, no prompts."
  homepage "https://github.com/EQuimper/cleanmyworktree"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.2.1/cmw-aarch64-apple-darwin.tar.xz"
      sha256 "7f21d17ed86b50415a8fabbe03f3cdd61ae642abf80e5847af19f9fd1ace9bad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.2.1/cmw-x86_64-apple-darwin.tar.xz"
      sha256 "b264ebee270e823f2d71d1b4a40a7555a75fec8358d082dfb76851dc222d1824"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.2.1/cmw-aarch64-unknown-linux-musl.tar.xz"
      sha256 "e3ee3b44cea70618c01bc73b3058002e4d84113f42e2626f7538ba13d255a0bc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/EQuimper/cleanmyworktree/releases/download/v0.2.1/cmw-x86_64-unknown-linux-musl.tar.xz"
      sha256 "d972445ec4f09719bfd7c3375c61cfeb93c121c23c4b7ff05ea70f841a8ac59c"
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
