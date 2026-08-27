# dotfiles

Configuration files for macOS and Linux.

## Contents

| Path | Description |
| --- | --- |
| `zsh/` | zsh configuration |
| `nvim/` | Neovim configuration |
| `wezterm/` | WezTerm configuration |
| `latex/` | latexmk configuration |
| `i3/` | i3 / i3status (Linux) |
| `xorg/` | X11 settings (Linux) |
| `feh/`, `imwheel/`, `fontconfig/` | Linux desktop utilities |

## Usage

```
cd ~
git clone https://github.com/cohsh/.dotfiles.git
cd .dotfiles
./install.sh
```

`install.sh` creates the symbolic links listed in `install.conf`.
Entries with an OS field (`linux` / `darwin`) are linked only on that OS.

Machine-local zsh settings go in `zsh/zshrc.d/local/`, which is ignored by
git. Every `*.zsh` dropped there is sourced at the end of `.zshrc`, so host-
specific or private settings can be kept outside this repository.

## License

MIT
