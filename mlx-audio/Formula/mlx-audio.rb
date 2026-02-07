class MlxAudio < Formula
  include Language::Python::Virtualenv

  desc "TTS and STS models locally on Mac using MLX"
  homepage "https://github.com/Blaizzy/mlx-audio"
  license "MIT"
  head "https://github.com/Blaizzy/mlx-audio.git", branch: "main"

  depends_on "ffmpeg"
  depends_on "portaudio"
  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python", "-m", "ensurepip"
    # webrtcvad needs setuptools/pkg_resources at runtime
    system libexec/"bin/python", "-m", "pip", "install", "setuptools"
    system libexec/"bin/python", "-m", "pip", "install", "-v", ".[server]"

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

  def plist_name
    "me.guoqiao.mlx-audio"
  end

  service do
    run [
      "/bin/bash", "-c",
      "#{opt_bin}/mlx-audio-server --host 0.0.0.0 --port ${MLX_AUDIO_SERVER_PORT:-8899} --log-dir #{var}/log/mlx-audio-server"
    ]
    keep_alive true
    working_dir var/"mlx-audio-server"
    log_path var/"log/mlx-audio-server/server.log"
    error_log_path var/"log/mlx-audio-server/server.error.log"
    environment_variables MLX_AUDIO_SERVER_PORT: "8899", PATH: std_service_path_env
  end

  test do
    system bin/"mlx-audio-server", "--help"
  end
end
