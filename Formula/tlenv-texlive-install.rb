class TlenvTexliveInstall < Formula
  desc "Install TeX Live versions (tlenv plugin)"
  homepage "https://github.com/munepi/tlenv-texlive-install"
  url "https://github.com/munepi/tlenv-texlive-install/archive/refs/tags/20260809.tar.gz"
  sha256 "805d644a256d7b7ec66cce0e79ed701fe07529f995aca544b04d0a01ab3e2b01"
  license "MIT"
  head "https://github.com/munepi/tlenv-texlive-install.git", branch: "master"

  def install
    bin.install "bin/texlive-install", "bin/tlenv-install", "bin/tlenv-uninstall"
    (share/"texlive-install").install Dir["share/texlive-install/*"]
    man1.install "share/man/man1/texlive-install.1"
  end

  def caveats
    <<~EOS
      texlive-install can be used on its own:
        texlive-install current ~/texlive/current

      As a tlenv plugin it provides `tlenv install' and `tlenv uninstall':
        brew install munepi/tlenv/tlenv
    EOS
  end

  test do
    assert_match "texlive-install", shell_output("#{bin}/texlive-install --version")
    assert_match "current", shell_output("#{bin}/texlive-install --definitions")
  end
end
