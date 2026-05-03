class Clis < Formula
  desc "Install modern Unix CLI tools in one command"
  homepage "https://github.com/guoqiao/homebrew-tap"
  head "https://github.com/guoqiao/homebrew-tap.git", branch: "main"
  license "MIT"

  # Curated list of modern Unix CLI tools.
  depends_on "bat"
  depends_on "bottom"
  depends_on "broot"
  depends_on "cheat"
  depends_on "choose"
  depends_on "curlie"
  depends_on "doggo"
  depends_on "duf"
  depends_on "dust"
  depends_on "eza"
  depends_on "fd"
  depends_on "fzf"
  depends_on "git-delta"
  depends_on "glances"
  depends_on "gping"
  depends_on "gtop"
  depends_on "httpie"
  depends_on "hyperfine"
  depends_on "jq"
  depends_on "lazygit"
  depends_on "lsd"
  depends_on "mcfly"
  depends_on "neovim"
  depends_on "procs"
  depends_on "ripgrep"
  depends_on "sd"
  depends_on "time"
  depends_on "tldr"
  depends_on "tree"
  depends_on "xh"
  depends_on "zoxide"
  depends_on "zsh"

  def install
    # Metapackage formula: dependencies provide all executables.
    (prefix/"share/clis").mkpath
  end

  test do
    assert_predicate prefix/"share/clis", :directory?
  end
end
