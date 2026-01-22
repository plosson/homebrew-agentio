class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "0a8dbd3bb3b82073b4a235c553cbdd257d8d2852c6eeb3d1bca3c89fbafeec05"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "23d61367b2a8275048573847e386af0f2abdb27ba7518c89ce8528d0351c6f9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "cc79f344c8ab34c4190003b4e478732f3641ee7e1bbe3832bd6cb92d3e4f4b92"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "c9364e4da8ffa3acab690db29c7eeb1743e4e19b69b4d31809602d23b912c5c5"
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
