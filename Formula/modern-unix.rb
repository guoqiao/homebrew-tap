class ModernUnix < Formula
  desc "Install modern Unix CLI tools in one command"
  homepage "https://github.com/guoqiao/homebrew-tap"
  head "https://github.com/guoqiao/homebrew-tap.git", branch: "main"
  license "MIT"

  # Curated list of modern Unix CLI tools.
  depends_on "bat"
  depends_on "eza"
  depends_on "lsd"
  depends_on "git-delta"
  depends_on "dust"
  depends_on "duf"
  depends_on "broot"
  depends_on "fd"
  depends_on "ripgrep"
  depends_on "fzf"
  depends_on "mcfly"
  depends_on "choose"
  depends_on "jq"
  depends_on "sd"
  depends_on "cheat"
  depends_on "tldr"
  depends_on "bottom"
  depends_on "glances"
  depends_on "gtop"
  depends_on "hyperfine"
  depends_on "gping"
  depends_on "procs"
  depends_on "httpie"
  depends_on "curlie"
  depends_on "xh"
  depends_on "zoxide"
  depends_on "doggo"
  depends_on "lazygit"

  def install
    # Metapackage formula: dependencies provide all executables.
    (prefix/"share/modern-unix").mkpath
  end

  test do
    assert_predicate prefix/"share/modern-unix", :directory?
  end
end
