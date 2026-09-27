class Lazystack < Formula
  desc "Fast, keyboard-driven TUI for managing OpenStack resources"
  homepage "https://github.com/larkly/lazystack"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-arm64"
      sha256 "659810594f65ef37aef147a7e0efcb1d67c32cd746aad2625c03c8f8385f1e10"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-amd64"
      sha256 "636b63e7eacf31d2246fc5abf4cb7f58f9d9075dbde1842d9df5f4511f9e640e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-arm64"
      sha256 "38068af211323f94a21b413b734d3a125b00d9ad2ddbca7cf5f5edc1a6c71588"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-amd64"
      sha256 "26315b7833a069ab28e9fb9838a94e16628502c05192783053dfad514ca66bc6"
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
