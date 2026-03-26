class Lazystack < Formula
  desc "Fast, keyboard-driven TUI for managing OpenStack resources"
  homepage "https://github.com/larkly/lazystack"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-arm64"
      sha256 "a4416c787df1f486a3c8dddc8fba9f988d729c16ee3f9bcc0b46bffb260503e3"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-amd64"
      sha256 "1d8d5f2776d674523764573c2f93917c89f9c3dcab0f9be523592667fee96723"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-arm64"
      sha256 "69d90559f00009a269c7f8dfd6732d19144650295fb68f82653bfff50bba0ed3"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-amd64"
      sha256 "a27e6120eae07c295bc8ef623a4a92ce3f8e69244b4beed1ec0dbddb5bb4685f"
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
