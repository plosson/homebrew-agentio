class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "d01b6a691a0777a69b1ae7f830b6d47a471d0ec4c0e5b33f75f75faf60bf39cd"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "e828accb355346453a62a4e1c3c27cd1a88ee80c07b6d1108d04b1a4f830be0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "e0de9a279705f0d0ea52e7850ec6f735823e0ee523ad55f812737f439bed8f17"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "5637caa40c4cf125d803b6fd28295a3a78e8311fc7ba1bc921fc598320b230a9"
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
