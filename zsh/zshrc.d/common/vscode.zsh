# vscode: give every project window of VS Code a color of its own
#
# `code <dir>` (exactly one argument, an existing directory) opens the
# folder through a one-folder workspace file kept in $VSCODE_WS_DIR
# (default: ~/.local/state/vscode-ws). The workspace settings color the
# title bar, activity bar and status bar. A folder opened for the first
# time takes the next color of the palette and keeps it; edit its
# workspace file to change it. Nothing is written into the folder.
#
# Any other use of `code` is passed through unchanged, and so is every
# call while $VSCODE_WS_DIR is not an absolute path (so that workspace
# files are never written into the current directory). To open a folder
# without a color, run `command code <dir>`.

if (( $+commands[code] )); then
    if [[ -z $VSCODE_WS_DIR ]]; then
        if [[ $XDG_STATE_HOME == /* ]]; then
            VSCODE_WS_DIR=$XDG_STATE_HOME/vscode-ws
        else
            VSCODE_WS_DIR=$HOME/.local/state/vscode-ws
        fi
    fi

    function code() {
        if (( $# != 1 )) || [[ ! -d $1 || $VSCODE_WS_DIR != /* ]]; then
            command code "$@"
            return
        fi

        local dir=${1:A}
        local id=$(print -rn -- "$dir" | cksum | cut -d ' ' -f 1)
        local ws=$VSCODE_WS_DIR/$id/${dir:t}.code-workspace

        if [[ ! -e $ws ]]; then
            local -a palette=('#1f6feb' '#8250df' '#bf3989' '#cf222e'
                              '#bc4c00' '#9a6700' '#1a7f37' '#0a7c86'
                              '#0550ae' '#6639ba' '#953800' '#57606a')
            local -a known=($VSCODE_WS_DIR/*/*.code-workspace(N))
            local color=${palette[$(( ${#known} % ${#palette} + 1 ))]}
            local jdir=${${dir//\\/\\\\}//\"/\\\"}

            command mkdir -p -- ${ws:h} || return
            cat > $ws.tmp <<EOF || return
{
  "folders": [ { "path": "$jdir" } ],
  "settings": {
    "workbench.colorCustomizations": {
      "titleBar.activeBackground": "$color",
      "titleBar.activeForeground": "#ffffff",
      "titleBar.inactiveBackground": "${color}99",
      "titleBar.inactiveForeground": "#ffffffcc",
      "activityBar.background": "$color",
      "activityBar.foreground": "#ffffff",
      "activityBar.inactiveForeground": "#ffffff99",
      "statusBar.background": "$color",
      "statusBar.foreground": "#ffffff"
    }
  }
}
EOF
            command mv -f -- $ws.tmp $ws || return
        fi

        command code "$ws"
    }
fi
