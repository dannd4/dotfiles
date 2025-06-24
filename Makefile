macos:
	@bash commands/macos_defaults.sh

install: brew-install node-install python-install link

brew-install:
	@bash commands/homebrew.sh

node-install:
	@bash commands/node.sh

python-install:
	@bash commands/python.sh

link:
	dotbot -c dotbot.conf.yaml

mackup:
	mackup restore --force


