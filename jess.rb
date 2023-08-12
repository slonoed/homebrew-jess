class Jess < Formula
  VERSION = "7"

  desc "AI assistant for software developers"
  homepage "https://github.com/assistant-ai/jess/tree/master"
  url "https://github.com/assistant-ai/jess/archive/refs/tags/v#{VERSION}.tar.gz"
  sha256 "4301bfabd453299a58f8b094a8b3546737bbb74d7e8ff5e999bbf015b211dcb5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "mod", "tidy"
    system "go", "build", "-ldflags=-X main.version=#{VERSION}", "-o", bin/"jess"
  end

  test do
    system bin/"jess", "--version"
  end
end

