macos:
	@bash commands/macos_defaults.sh

brew-install:
	@bash commands/homebrew.sh

link:
	dotbot -c dotbot.conf.yaml
