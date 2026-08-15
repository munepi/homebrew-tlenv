class Tlenv < Formula
  desc "TeX Live version manager tool on Unix-like systems"
  homepage "https://github.com/munepi/tlenv"
  url "https://github.com/munepi/tlenv/archive/refs/tags/v0.2.tar.gz"
  sha256 "fc41b20f87b4609220c77e0d83d37a40c5b7ca86d078cccc68b4177b5dc1c941"
  license "MIT"
  head "https://github.com/munepi/tlenv.git", branch: "master"

  depends_on "munepi/tlenv/tlenv-texlive-install" => :recommended

  def install
    prefix.install "bin", "completions", "libexec", "tlenv.d"
    man1.install "share/man/man1/tlenv.1"
    zsh_completion.install_symlink prefix/"completions/_tlenv"
  end

  def caveats
    <<~EOS
      tlenv keeps its TeX Live versions under TLENV_ROOT (default: ~/.tlenv).

      To finish the installation, run:
        tlenv init
      and restart your shell.

      Then install a TeX Live version:
        tlenv install current
        tlenv global current
    EOS
  end

  test do
    assert_match "tlenv #{version}", shell_output("#{bin}/tlenv --version")

    ENV["TLENV_ROOT"] = testpath/".tlenv"
    assert_match "global", shell_output("#{bin}/tlenv commands")
    assert_match "TLENV_SHELL=bash", shell_output("#{bin}/tlenv init - bash")
  end
end
