### SETTINGS ###
HOMEBREW_NO_ENV_HINTS=1
IGNOREPKGS=0
BREWAPPLIST="nvim vim eza neofetch fastfetch task tldr htop bat duf fossil"
THEME="gentoo" # gentoo or default

###          ###

### ALIASES ###

alias ls="eza --color=auto -A"
alias neo="neofetch"
alias man="tldr"
alias cat="bat"
alias df="duf"

###         ###

### SERVICES... ###

# enable brew.
if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	[[ -r "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh" ]] && . "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh"
else
        read -p "Brew doesn't exist in your system. Should we install it? (It's a dependency, my configuration is using brew. If you select n, configuration may have issues.) [y/N] " brewinst

        if [ "$brewinst" == "y" ]; then
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
		[[ -r "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh" ]] && . "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh"
        fi
fi

### STARTUP ###

neofetch

###         ###

# install apps and configs.
if ! [ "$IGNOREPKGS" == "1" ]; then
                                for app in $BREWAPPLIST; do
                                        if ! command -v $app >/dev/null; then
                                                                read -p "$app does not exist in your system. Should we install it? [y/N] " appinst
                                                        if [ "$appinst" == "y" ]; then
                                                                                                brew install $app
                                        fi
                                        fi
                                done
fi

if ! [ -d "$HOME/.config/nvim" ]; then
        read -p "You system doesn't have a neovim config. Should we install Quitaxd's NVIM config? [y/N] " nvimconf

        if [ "$nvimconf" == "y" ]; then
                curl https://raw.githubusercontent.com/Quitaxd/nvim/main/install.sh | bash
        fi
fi

if [ "$THEME" == "default" ]; then
                                export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\] $ "
elif [ "$THEME" == "gentoo" ]; then
                                export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
else
                                echo "$THEME theme does not exist."
fi
