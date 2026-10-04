# vscode: give every project window of VS Code a color of its own
#
# `code <dir>` (exactly one argument, an existing directory) opens the
# folder as usual. If the folder has no .vscode/settings.json yet (or only
# an empty one), one is written first that colors the title bar and the
# status bar with the next color of a muted palette, so every project
# keeps a color of its own. In a git work tree the file is also added to
# .git/info/exclude, so it is never committed. A folder whose
# .vscode/settings.json has any settings is left as it is.
#
# Other extensions that manage these colors (e.g. Peacock) may remove
# them again; use one or the other.
#
# Any other use of `code` is passed through unchanged. To open a folder
# without giving it a color, run `command code <dir>`.

if (( $+commands[code] )); then
    function code() {
        if (( $# == 1 )) && [[ -d $1 ]]; then
            __code_color ${1:A}
        fi
        command code "$@"
    }

    # Write $1/.vscode/settings.json with the next palette color unless the
    # file has settings already; the index of the next color is kept in a
    # state file.
    function __code_color() {
        local dir=$1 settings=$1/.vscode/settings.json
        if [[ -e $settings ]]; then
            local content=${"$(<$settings)"//[[:space:]]/}
            [[ -z $content || $content == '{}' ]] || return
        fi
        [[ -w $dir ]] || return

        local -a palette=('#374b62' '#624737' '#376247' '#623759'
                          '#625537' '#375962' '#62373d' '#526237'
                          '#473762' '#37625c' '#5c3762' '#373d62')
        local state=${XDG_STATE_HOME:-$HOME/.local/state}/vscode-color
        [[ $state == /* ]] || state=$HOME/.local/state/vscode-color
        local next=0
        [[ -r $state/next ]] && next=$(<$state/next)
        [[ $next == <-> ]] || next=0
        local color=${palette[$(( next % ${#palette} + 1 ))]}

        command mkdir -p -- $dir/.vscode || return
        cat > $settings.tmp <<EOF || return
{
  "workbench.colorCustomizations": {
    "titleBar.activeBackground": "$color",
    "titleBar.activeForeground": "#e6e6e6",
    "titleBar.inactiveBackground": "${color}b3",
    "titleBar.inactiveForeground": "#e6e6e6b3",
    "statusBar.background": "$color",
    "statusBar.foreground": "#e6e6e6"
  }
}
EOF
        command mv -f -- $settings.tmp $settings || return
        command mkdir -p -- $state && print -r -- $(( next + 1 )) > $state/next

        # keep the file out of git (relative to the root of the work tree)
        if (( $+commands[git] )) && git -C $dir rev-parse --is-inside-work-tree &> /dev/null; then
            local exclude=$(git -C $dir rev-parse --git-path info/exclude)
            [[ $exclude == /* ]] || exclude=$dir/$exclude
            local entry=/$(git -C $dir rev-parse --show-prefix).vscode/settings.json
            command mkdir -p -- ${exclude:h}
            command grep -qxF -- $entry $exclude 2> /dev/null || print -r -- $entry >> $exclude
        fi
    }
fi
