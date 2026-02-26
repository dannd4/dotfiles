macos:
	@bash commands/macos_defaults.sh

brew:
	@bash commands/homebrew.sh

link:
	@bash vendor/dotbot/bin/dotbot -c dotbot.conf.yaml
