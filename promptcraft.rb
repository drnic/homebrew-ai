class Promptcraft < Formula
  desc "Try out new system prompts on your existing AI conversations. Over and over until you're happy."
  homepage "https://github.com/drnic/promptcraft"
  version "0.1.0"
  url "https://github.com/drnic/promptcraft/releases/download/v0.1.0/promptcraft-0.1.0.tar.xz"
  sha256 "2ced998916398902db0345064a118df10989411e4af7c1188ea966f0cc8f0f22"

  depends_on "ruby@3.3"

  def install
    # Extract all files to libexec, which is a common Homebrew practice for third-party tools
    libexec.install Dir["*"]
    # Create a symbolic link for the executable in Homebrew's bin directory
    bin.install_symlink "#{libexec}/exe/promptcraft" => "promptcraft"
  end

  test do
    # Simple test to check the version or a help command
    system "#{bin}/promptcraft", "--version"
  end
end
