class Lazystack < Formula
  desc "Fast, keyboard-driven TUI for managing OpenStack resources"
  homepage "https://github.com/larkly/lazystack"
  version "0.8.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-arm64"
      sha256 "0fc4fc54ecfc6740a53ec208cd4a445ff1e3980872e9e927bd490cacd17b482d"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-amd64"
      sha256 "6aaa510778a01cc20973ceeaff339700877f0d01fb5d62149741e6583c4b900e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-arm64"
      sha256 "919f606345d588a59c01c55785af98497453033a65800076c1bfa4e6236bba92"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-amd64"
      sha256 "3452c411f9b4ddd685b240d8e3cb42e5969296650b6240832acf793985aad10d"
    end
  end

  def install
    binary = Dir.glob("lazystack-*").first || "lazystack"
    bin.install binary => "lazystack"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazystack --version")
  end
end
