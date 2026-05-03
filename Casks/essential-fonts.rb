cask "essential-fonts" do
  version :latest
  sha256 :no_check

  url "https://github.com/guoqiao/homebrew-tap"
  name "Essential Coding Fonts"
  desc "Meta cask to install essential coding fonts"
  homepage "https://github.com/guoqiao/homebrew-tap"

  depends_on cask: "font-cascadia-code"
  depends_on cask: "font-fira-code"
  depends_on cask: "font-hack"
  depends_on cask: "font-inconsolata"
  depends_on cask: "font-iosevka"
  depends_on cask: "font-jetbrains-mono"
  depends_on cask: "font-monaspace"
  depends_on cask: "font-source-code-pro"
  depends_on cask: "font-victor-mono"

  stage_only true
end
