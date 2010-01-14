## Sets up the environment for interactive and non-interactive
## zsh sessions.

export PATH=$PATH:/sbin:/usr/sbin:$HOME/bin

if [[ $ENV_SOURCED != 'true' ]]
then
	export PATH=$PATH:/sbin:/usr/sbin:$HOME/bin

	export ENV_SOURCED='true'
fi
