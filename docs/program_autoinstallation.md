# Program Autoinstallation
We use brew for automatic programme installation. (Brew installs automatically.)

We can check these codes;

```bash
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
```

NOTE: My configuration will install programs that you don't have on your system.