require "language/node"

class ClaudeCode < Formula
  desc "Claude Code: Anthropic's CLI for AI code generation and assistance"
  homepage "https://github.com/anthropic-ai/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-1.0.24.tgz"
  sha256 "5573ebbc0ef233bb69678c006ec32d4cf2f94d1324365aa9ea29cb3e28a123b2"
  license "Apache-2.0"

  depends_on "node"

  def install
    # Unpack npm tarball into a temp directory
    mkdir "src"
    system "tar", "-xzf", cached_download, "-C", "src"

    # The npm tarball unpacks to a folder called `package/`
    cd "src/package" do
      # Install everything into libexec
      libexec.install Dir["*"]
      bin.install_symlink libexec/"bin/claude"
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/claude --help")
  end

end
