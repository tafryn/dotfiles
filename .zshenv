## Sets up the environment for interactive and non-interactive
## zsh sessions.

if [[ $ENV_SOURCED != 'true' ]]
then
	export PATH=$PATH:/sbin:/usr/sbin:$HOME/bin

	export ENV_SOURCED='true'
fi
