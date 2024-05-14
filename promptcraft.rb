class Promptcraft < Formula
  desc "Try out new system prompts on your existing AI conversations. Over and over until you're happy."
  homepage "https://github.com/drnic/promptcraft"
  version "0.1.2"
  url "https://github.com/drnic/promptcraft/releases/download/v0.1.2/promptcraft-0.1.2.tar.xz"
  sha256 "7b65c0e1e990b70accf17095d9fec3a6db069f8be49053c1478012e247f0f12e"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    # Extract all files to libexec, which is a common Homebrew practice for third-party tools
    libexec.install Dir["*"]

    bin.install libexec/"exe/promptcraft"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV.fetch("GEM_HOME"))
  end

  test do
    # Simple test to check the version or a help command
    system "#{bin}/promptcraft", "--version"
  end
end
