cask "essential-apps" do
  version :latest
  sha256 :no_check

  url "https://example.com"
  name "Essential Apps"
  desc "Meta cask to install Google Chrome, Lens, and Zed"
  homepage "https://github.com/idevpi/homebrew-tap"

  depends_on cask: "google-chrome"
  depends_on cask: "lens"
  depends_on cask: "zed"
end
