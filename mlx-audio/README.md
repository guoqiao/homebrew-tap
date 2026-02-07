# homebrew formula for mlx-audio

Homebrew Formula for [mlx-audio](https://github.com/Blaizzy/mlx-audio) - an audio processing library built on Apple's MLX framework for text-to-speech (TTS), speech-to-text (STT), and speech-to-speech (STS) on Apple Silicon.

## Installation

Tap and install:

```bash
brew tap guoqiao/tap
brew install --HEAD mlx-audio
```

## Usage

After installation, you can use the mlx-audio command-line tools:

```bash
# Text-to-Speech generation (English)
mlx_audio.tts.generate --model mlx-community/Kokoro-82M-bf16 --text 'Hello, world!' --lang_code en

# Speech-to-Text transcription
mlx_audio.stt.generate --help

# Model conversion
mlx_audio.convert --help

# Run server in foreground:
mlx_audio.server --host 0.0.0.0 --port 8899
```

Or you can run server as a LaunchAgent service in background:
```
brew services start mlx-audio
brew services stop mlx-audio
brew services restart mlx-audio
```
This will serve an OpenAI-compatible API in your LAN, on port 8899 by default.

NOTE: service is not started after install, you need to start it separately.

## API Server Examples

To use transcription API with glm-asr-nano-2512 model:

Example 1: with openai python sdk:

see [./openai_api_transcribe.py](./openai_api_transcribe.py)

Example 2: use in Spokenly app as OpenAI Compatible API:
```
URL: http://<IP>:8899
Model: mlx-community/glm-asr-nano-2512-8bit
API KEY: <blank>
```
NOTE: `/v1` is not needed in URL here.

## About

This is a Homebrew tap for the mlx-audio Python package, providing fast and efficient audio processing on Apple Silicon using MLX framework.

For more information, visit the [mlx-audio repository](https://github.com/Blaizzy/mlx-audio).
