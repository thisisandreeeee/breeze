# Breeze

Bootstrap my macOS/Linux development environment:

```bash
git clone git@github.com:thisisandreeeee/breeze.git
cd breeze
bash ./setup.sh
```

The setup installs OS packages, Oh My Zsh, Neovim config/plugins, tmux config/plugins, and `uv` for Python projects.

Prerequisites: Homebrew on macOS or `apt` on Linux, plus Node.js. On Linux, install Neovim separately (the APT package list currently installs Vim only).

## Daily workflow

Use one tmux session, with one window per project and panes for the editor, server, tests, logs, etc.

```bash
tmux new -s dev                         # start the dev session
tmux new-window -n api -c ~/code/api    # add a project window
tmux attach -t dev                      # return later
nvim .                                  # edit the current project
```

Useful tmux keys (`prefix` is `Ctrl-b`):

| Key | Action |
| --- | --- |
| `prefix c` | New window |
| `prefix ,` | Rename window |
| `prefix 1..9` | Select project window |
| `prefix \` / `prefix -` | Split right / down in the current directory |
| `Ctrl-h/j/k/l` | Move between Neovim splits and tmux panes |
| `Alt-h/j/k/l` | Resize a pane |
| `prefix z` | Zoom/unzoom a pane |
| `prefix r` | Reload tmux config |

In Neovim, press `Space` and pause to discover configured commands. Useful starting points: `Space sf` (files), `Space sg` (grep), `Ctrl-n` (file tree), `Space gl` (Lazygit), `gd` (definition), and `gr` (references).

## CLI cheat sheet

| Tool | What it is for | Example |
| --- | --- | --- |
| `git` | Version control | `git status` |
| `nvim` / `vim` | Terminal editors (`nvim` is the configured default) | `nvim .` |
| `tmux` | Persistent terminal sessions, windows, and panes | `tmux attach -t dev` |
| `zsh` | Interactive shell | `exec zsh` |
| `rg` | Fast recursive text search | `rg 'TODO|FIXME' src` |
| `fd` | Friendly file finder | `fd '\.py$'` |
| `bat` | File viewer with highlighting | `bat README.md` |
| `eza` | Modern directory listing | `eza -lah --git` |
| `zoxide` | Frecency-based directory jumping | `z breeze` |
| `fzf` | Fuzzy picker; composes with other tools | `nvim "$(fd -t f | fzf)"` |
| `delta` | Readable Git diffs | `git diff` |
| `tldr` | Short command examples | `tldr tmux` |
| `htop` | Interactive process monitor | `htop` |
| `lazygit` | Terminal UI for Git | `lazygit` |
| `uv` | Manage Python versions, environments, and dependencies | `uv run python` |
| build tools | Compilers and `make` (Linux: `build-essential`) | `make` |

Notes: Debian/Ubuntu installs `fd` and `bat` as `fdfind` and `batcat`; setup adds the usual names under `~/.local/bin`. `tlrc` (Homebrew) and `tealdeer` (APT) both provide the `tldr` command. `lazygit` is currently installed by the macOS package list only.

The Zsh config maps `grep`, `find`, `cat`, `ls`, and `cd` to `rg`, `fd`, `bat`, `eza`, and `zoxide`. Use `command <name>` to bypass an alias. `Ctrl-t` fuzzy-selects a file and `Alt-c` fuzzy-selects a directory.

## Quick checks

```bash
nvim +checkhealth       # editor/tooling diagnostics
tmux list-sessions      # running workspaces
uv python list          # available Python versions
uv sync                 # install the current project's dependencies
```

## iTerm2 (macOS)

Install [iTerm2](https://www.iterm2.com/). Import the sample theme from [`misc`](./misc) via **Settings > Profiles > Colors > Color Presets > Import**; the included Nerd Font can be selected under **Profiles > Text**.
