require "language/node"

class ClaudeCode < Formula
  desc "Claude Code: Anthropic's CLI for AI code generation and assistance"
  homepage "https://github.com/anthropic-ai/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-1.0.24.tgz"
  sha256 "5573ebbc0ef233bb69678c006ec32d4cf2f94d1324365aa9ea29cb3e28a123b2"
  license "Apache-2.0"

  depends_on "node"

  def install
    # Install into libexec using npm
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    # Create executable that invokes node with ESM flags
    (bin/"claude").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" --no-warnings --enable-source-maps "#{libexec}/cli.js" "$@"
    EOS

    chmod "+x", bin/"claude"
  end

  test do
    system "#{bin}/claude", "--help"
  end

end
