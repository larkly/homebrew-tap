class Lazystack < Formula
  desc "Fast, keyboard-driven TUI for managing OpenStack resources"
  homepage "https://github.com/larkly/lazystack"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-arm64"
      sha256 "a452cef6011d4684254734e668956dc76e11192eb9b2548876710fa6be4c5882"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-amd64"
      sha256 "e671288ac0c85a1666ea159afb164efd7eb964fa5d5a84d36db6c35fb1a31b12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-arm64"
      sha256 "fc91e6cc40cd646b3aff9acfaf9dd9c5c049a8bb3801b009ab75e222dbeef9d9"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-amd64"
      sha256 "f8b375a110a938ad4c35a1616e2994d64891f1b4d51f66947f0faf2870563ba4"
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
