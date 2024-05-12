class Promptcraft < Formula
  desc "Try out new system prompts on your existing AI conversations. Over and over until you're happy."
  homepage "https://github.com/drnic/promptcraft"
  url "https://rubygems.org/downloads/promptcraft-0.1.0.gem"
  sha256 "0fc084c6d9c04936d58421976257573cfc7f82a321f758feb25223558d6fbf5f"

  depends_on "ruby@3.3"

  def install
    libexec = Pathname.new("#{HOMEBREW_PREFIX}/libexec")
    libexec.install "promptcraft-0.1.0.gem", "Gemfile.lock"
    ENV["GEM_HOME"] = libexec
    system "bundle", "install", "--path=#{libexec}"
    system "gem", "install", libexec/"promptcraft-0.1.0.gem"
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end
end
