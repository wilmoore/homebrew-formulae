require "language/node"

class ClaudeCode < Formula
  desc "Claude Code: Anthropic's CLI for AI code generation and assistance"
  homepage "https://github.com/anthropic-ai/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-1.0.24.tgz"
  sha256 "5573ebbc0ef233bb69678c006ec32d4cf2f94d1324365aa9ea29cb3e28a123b2"
  license "Apache-2.0"

  depends_on "node"

  def install
    # Unpack the tarball manually
    system "tar", "-xzf", cached_download, "--strip-components=1"

    # Install everything into libexec
    libexec.install Dir["*"]

    # Create a wrapper or symlink
    bin.install_symlink libexec/"bin/claude"
  end

  test do
    # Verify the CLI works
    assert_match "Usage", shell_output("#{bin}/claude --help")
  end

end
