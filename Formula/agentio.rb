class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "58da783b31626414a2c0502dcfcb2dcece37cfff6c883481f1d70bffdcc3ba17"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "c4cdfc67e507a08ebe4c7ccfc3b5e97b2743d150bfaddc5798213bd42db30ef5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "99c283fa8d8340f608541ed99f904ea46273fbc73e58675ac0c7472676bc62a9"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "0e4965f3c39505ca29c5088a2fcdca4ed52a93a9708d0782fd32298334877adb"
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
