class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "4abe854792f70389889fe8877574b8ce85d64c2f131665c9b11ea5a45c56cc3c"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "8f865460fc5bcb6a868371cd6b9d5578ac3c2d87b848e77bd5803d57634dddb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "d7cd98ca647244e98704a11db930581a6f0aff51dbd91c36d59007fd58ddaf04"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "c9e8c7dc29abe7eabf50f9e7a0d43cacf500bf3bc96b6a6289a6d2f65f111ff8"
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
