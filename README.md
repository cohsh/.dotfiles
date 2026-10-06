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

## Shell aliases

Convenience aliases use separate names so standard commands such as `ls`,
`grep`, `mkdir`, `cp`, `mv`, `rm`, and `sudo` keep their original arguments.
Restart your shell after updating to discard aliases loaded by older versions.

| Shortcut | Behavior |
| --- | --- |
| `l`, `la` | Long, time-sorted listing with OS-specific colors; `la` includes hidden entries |
| `ll` | Clear the screen, then run `l` |
| `ldirs`, `lle <extension>` | List directories or files with the given extension using `l` |
| `dfh`, `duh` | Human-readable disk usage |
| `grepc`, `lessr` | Colored grep output or a pager that displays ANSI colors |
| `mkp` | Create directories, including missing parents |
| `cpi`, `mvi`, `rmi` | Confirm overwrites when copying or moving; confirm removals |
| `gcm`, `gst` | `git commit -m` and `git status` |
| `xopen` | Open a file or URL with `xdg-open` on Linux |
| `clipcopy`, `clippaste` | Clipboard access on macOS and Linux |

The old `gc`, `gs`, and `lld` shortcuts were renamed to `gcm`, `gst`, and
`ldirs` to avoid collisions with Graphviz, Ghostscript, and the LLVM linker.
The `sl` typo alias was removed.

The existing `code <dir>` function still applies project window colors before
launching VS Code. Use `command code <dir>` to bypass that helper.

## License

MIT
