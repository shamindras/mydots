.PHONY: brewfile

brewfile:
	brew update
	brew upgrade
	@printf ">>> Creating brewfile..."
	@brew bundle dump --describe --force --file=./config/brew/Brewfile
	@printf "\n>>> Brewfile created at ./config/brew/Brewfile"
