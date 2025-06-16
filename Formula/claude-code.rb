require "language/node"

class ClaudeCode < Formula
  desc "Claude Code: Anthropic's CLI for AI code generation and assistance"
  homepage "https://github.com/anthropic-ai/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-1.0.24.tgz"
  sha256 "5573ebbc0ef233bb69678c006ec32d4cf2f94d1324365aa9ea29cb3e28a123b2"
  license "Apache-2.0"

  depends_on "node"

  def install
    mkdir "src"
    system "tar", "-xzf", cached_download, "-C", "src"
    cd "src/package" do
      libexec.install Dir["*"]

      (bin/"claude").write <<~EOS
        #!/bin/bash
        exec "#{Formula["node"].opt_bin}/node" --no-warnings --enable-source-maps "#{libexec}/cli.js" "$@"
      EOS
      chmod "+x", bin/"claude"
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/claude --help")
  end

end
