cask "essential-fonts" do
  version :latest
  sha256 :no_check

  url "https://github.com/guoqiao/homebrew-tap"
  name "Essential Coding Fonts"
  desc "Meta cask to install Fira Code, JetBrains Mono, and Source Code Pro"
  homepage "https://github.com/guoqiao/homebrew-tap"

  depends_on cask: "font-fira-code"
  depends_on cask: "font-jetbrains-mono"
  depends_on cask: "font-source-code-pro"

  stage_only true
end
