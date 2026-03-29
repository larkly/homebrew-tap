class Lazystack < Formula
  desc "Fast, keyboard-driven TUI for managing OpenStack resources"
  homepage "https://github.com/larkly/lazystack"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-arm64"
      sha256 "04adbb3ac591afcd091f4373e095293840b85e4d51f701d6e9877496fa9ef476"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-darwin-amd64"
      sha256 "9d5751122e17656423a2876f48be0c0e995198dd4adf7ac7d8894171a9bece64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-arm64"
      sha256 "6e5354629d6cb28647fe888e0d365ae509519455857d098a2f48ead2a09a88c9"
    elsif Hardware::CPU.intel?
      url "https://github.com/larkly/lazystack/releases/download/v#{version}/lazystack-linux-amd64"
      sha256 "ded02d7560a48ed6781d16c004739589aab7dfdb37761529e375528dca22747d"
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
