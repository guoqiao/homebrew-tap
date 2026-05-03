cask "essential-fonts" do
  version :latest
  sha256 :no_check

  name "Essential Coding Fonts"
  desc "Meta cask to install Fira Code, JetBrains Mono, and Source Code Pro"
  homepage "https://github.com/idevpi/homebrew-tap"

  depends_on cask: "font-fira-code"
  depends_on cask: "font-jetbrains-mono"
  depends_on cask: "font-source-code-pro"
end
