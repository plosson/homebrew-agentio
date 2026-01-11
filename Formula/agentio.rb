class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "7cf19c13e645c98526b5898f23fc0e1490437dcfaa7a107a9eb46a2c8d509e84"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "c2bceb24e96b3131a80039e7d57efc581430d08a6cd1ffae926f5acb939aa025"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "c548f634d5e0086b97c4918949e8dbaa53a3480eb31d89a1bf7e835165294c30"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "9ca1edb666237b2acd5b5ffa0c42a975e6dd7e553fb125d6c8fdf4f4ce0c8bdd"
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
