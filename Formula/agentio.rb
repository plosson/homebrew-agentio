class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "430d10c2f54328bedd3219ae5d2c3e76f04d08d2aa5abf904edf187efcc4526d"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "75490dd3313de23ca41db5957b84e943c23c5745d1be7a88b02ee65ff87a0222"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "eb5871f73df0fa0095fbbd617567c356d782bdd5417a8e027582d3f818ac74ba"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "ed95051d9bddf72bf871dc74a08debaa11596ca95c3031bf30bd3c2e3f01ec4c"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "agentio"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentio --version")
  end
end
