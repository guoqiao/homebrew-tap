tap:
	brew tap guoqiao/tap

clis: tap
	brew install --HEAD guoqiao/tap/clis

apps: tap
	brew install --cask guoqiao/tap/apps

fonts-family:
	fc-list : family

fonts-mono:
	fc-list :spacing=mono family

fonts-cache:
	fc-cache -fv

fonts: tap
	brew install --casks guoqiao/tap/fonts
	make fonts-cache
	make fonts-family

