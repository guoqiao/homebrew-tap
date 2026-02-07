class MlxAudioServer < Formula
  include Language::Python::Virtualenv

  desc "TTS and STS models locally on Mac using MLX"
  homepage "https://github.com/Blaizzy/mlx-audio"
  license "MIT"
  # stable version: brew install guoqiao/tap/mlx-audio-server
  url "https://github.com/Blaizzy/mlx-audio.git", revision: "ddee9632f1e40f8eefda897921933005578677bc"
  version "0.3.1-ddee963"
  # HEAD version: brew install --HEAD guoqiao/tap/mlx-audio-server
  head "https://github.com/Blaizzy/mlx-audio.git", branch: "main"

  depends_on "ffmpeg"
  depends_on "python@3.12"

  # Prevent Homebrew from rewriting dylib paths in Python packages
  # (pydantic_core paths are too long for Mach-O headers)
  skip_clean "libexec"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python", "-m", "ensurepip"
    # webrtcvad needs setuptools/pkg_resources at runtime
    system libexec/"bin/python", "-m", "pip", "install", "setuptools"
    system libexec/"bin/python", "-m", "pip", "install", ".[server]"

    # Force reinstall webrtcvad to ensure it links correctly after setuptools
    system libexec/"bin/python", "-m", "pip", "install", "--force-reinstall", "webrtcvad"
    # Link the entry points
    # Expose with friendly names (dashes)
    bin.install_symlink libexec/"bin/mlx_audio.server" => "mlx-audio-server"
    bin.install_symlink libexec/"bin/mlx_audio.convert" => "mlx-audio-convert"
    bin.install_symlink libexec/"bin/mlx_audio.stt.generate" => "mlx-audio-stt-generate"
    bin.install_symlink libexec/"bin/mlx_audio.tts.generate" => "mlx-audio-tts-generate"

    # Also expose original dotted names for compatibility
    bin.install_symlink libexec/"bin/mlx_audio.server"
    bin.install_symlink libexec/"bin/mlx_audio.convert"
    bin.install_symlink libexec/"bin/mlx_audio.stt.generate"
    bin.install_symlink libexec/"bin/mlx_audio.tts.generate"
  end

  def post_install
    # Create directories for logs and state
    (var/"mlx-audio-server").mkpath
    (var/"log/mlx-audio-server").mkpath
  end

  service do
    name macos: "me.guoqiao.mlx-audio-server"
    run [opt_bin/"mlx-audio-server", "--host", "0.0.0.0", "--port", "8899", "--log-dir", var/"log/mlx-audio-server"]
    keep_alive true
    working_dir var/"mlx-audio-server"
    log_path var/"log/mlx-audio-server/server.log"
    error_log_path var/"log/mlx-audio-server/server.error.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    system bin/"mlx-audio-server", "--help"
  end
end
