# guoqiao's Homebrew Tap

Homebrew tap for guoqiao's brew formula collection.

# Install Tap

```
brew tap guoqiao/tap
```

# Install Formula

install mlx-audio cli tools and start a local openai-compatible transcription api LaunchAgent service:
```
brew install guoqiao/tap/mlx-audio-server
brew service start mlx-audio-server
```

install modern unix cli tools in 1 cmd:
```
# head-only, always install the latest commit on main branch
brew install --HEAD guoqiao/tap/modern-unix

```
NOTE:
based on [modern-unix](https://github.com/ibraheemdev/modern-unix/blob/master/README.md), but will evolve.
