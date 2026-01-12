class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.1.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "09aaec8d1483b7e4f303cbdea400515fe45a5b486786a6fb82f3be042a98c9ba"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "89e96e1bedd575ddddc424627a401766ad3592b6a3c7a04e7916505b083c6878"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "b69485ac52dabe88e34f23e25922781a42e850ebbc65689908b3f62883e7d895"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "05522d78ba6cb996eff10f9e8c274525bfc7d3202a14bcf39c7b1c342516f622"
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
