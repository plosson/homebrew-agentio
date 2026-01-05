class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "bb89bb3727347a561b34b3bccd55d1a2f2af66613c2c90029e22feaf956257da"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "fe5a963ca01e43db8439bf23d7671f56d92d4405a2c2e4baa42c87e342f84234"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "14654ccaabd04fc95f9706259aafc1ed7f94d939f9f01fc0c5b873924becf24d"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "1799355dfece5d048114a6244dcb39a090e7ccd1ed5a90cc8075eb7beb53cb6d"
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
