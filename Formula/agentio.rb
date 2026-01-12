class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.1.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "25ae956e3a244e96edccfcc36b0146f7f765c3a18fcff9fd167701db01e7f9ff"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "bb8646910bfd49e8d03556af259253b1c6a782de47370bc2b19dfa796211bcfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "09b6c7044c3fb8bcae7eb07ef0fe353b19470ed4df1f946b5c9fb809ccafbfc2"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "4f04d4b7d9aa06d396aa101cd0efaa3d14d2403b682308caa5d06e9dc39d66d3"
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
