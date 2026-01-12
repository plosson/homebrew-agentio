class Agentio < Formula
  desc "CLI for LLM agents to interact with communication and tracking services"
  homepage "https://github.com/plosson/agentio"
  version "0.1.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-arm64"
      sha256 "6e44154d4e60c13682840b6593b4f25b45bc3f6856b86999de39bb01196c7762"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-darwin-x64"
      sha256 "66edc09a96e0a91dd540292e173adfbd5ef98bfdaeff36d2e759ec4536bdfbab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-arm64"
      sha256 "ae5c8fbe31a8b23f3d15eea881cf49be997e5dec6ae5d0a83d30ab1d59a24f0b"
    else
      url "https://github.com/plosson/agentio/releases/download/v#{version}/agentio-linux-x64"
      sha256 "ab4e8faf161f447c3e1b98f887abc2054800c2fb2ae28a62b397b9bc309c878d"
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
